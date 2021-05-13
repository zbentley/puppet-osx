require 'puppet/util/errors'
require 'puppet/util/execution'
require 'set'

Puppet::Type.type(:osx_default).provide :defaults do
  include Puppet::Util::Execution
  include Puppet::Util::Errors

  def exists?
    type_call(:exists?)
  end

  def destroy
    run true, :delete, domain, key
  end

  def create
    run true, :write, domain, key, *type_call(:value_string)
  end

  private

  def type_call(call)
    type_sym = "#{type}_#{call}".to_sym
    return send(type_sym) if respond_to?(type_sym, true)
    send "generic_#{call}".to_sym
  end

  def run(failonfail, cmd, *args)
    execute(
      ['defaults', *host, cmd, *args],
      failonfail: failonfail,
      uid: user,
      combine: true,
    )
  end

  def read
    run(false, :read, domain, key).rstrip
  end

  def read_type
    run(false, :'read-type', domain, key).split.last
  end

  def host
    return [@host] if @host
    @host = case @resource[:host]
            when /^(current|currentHost)$/
              ['-currentHost']
            when nil
              ['-currentHost']
            else
              ["-host", @resource[:host]]
            end
  end

  def user
    @user ||= @resource[:user] || Facter.value(:boxen_user)
  end

  def domain
    @domain ||= @resource[:domain]
  end

  def key
    @key ||= @resource[:key]
  end

  def value
    @value ||= @resource[:value]
  end

  def type
    @type ||= @resource[:type].to_s
  end

  def values_as_hash
    Hash[value.map { |x| x.values_at(0, 2).map(&:to_s) }]
  end

  def current_dict
    raw = read.split("\n")[1...-1].map { |l| l.split(nil, 3).values_at(0, 2) }
    Hash[raw.map { |k, v| [k, clean_dict_value(v)] }]
  end

  def clean_dict_value(v)
    v.match(/^"?(.*[^"])"?;/)[1]
  end

  def generic_exists?
    read == value.to_s && read_type == type
  end

  def dict_exists?
    read_type.start_with?('dict') && current_dict == values_as_hash
  end

  def generic_value_string
    ["-#{type}", value]
  end

  def dict_value_string
    ['-dict',  value.map { |k, t, v| "#{k} -#{t} '#{v}'" }.join(' ')]
  end
end
