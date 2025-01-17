Puppet::Type.newtype(:osx_default) do
  @doc = ""

  ensurable do
    defaultvalues
    defaultto :present
  end

  validate do
    ['user', 'domain', 'key', 'value'].each do |req|
      raise(ArgumentError, "Parameter #{req} is required") if self[req.to_sym].nil?
    end
    if self[:type] == :dict
      self[:type] = :dictionary
    end
    if self[:type].nil?
      if [true, false].include? self[:value]
        self[:type] = :boolean
      else
        raise(ArgumentError, "Parameter type is required")
      end
    end
  end

  newparam(:name) do
    desc 'Description of option'
  end

  newparam(:host) do
    desc 'Host to operate on'
    newvalues(nil, 'currentHost')
  end

  newparam(:user) do
    desc 'User to set value for'
  end

  newparam(:domain) do
    desc 'Domain to operate on'
  end

  newparam(:key) do
    desc 'Key to operate on'
  end

  newparam(:value) do
    desc 'Value to use for key'
  end

  newparam(:type) do
    desc 'Type for key'
    newvalues(:boolean, :bool, :integer, :dict, :dictionary, :int, :string, :array)
  end
end
