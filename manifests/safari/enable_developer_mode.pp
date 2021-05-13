# Public: Enables developer mode in Safari
#
# Examples
#
#   include osx::safari::enable_developer_mode
#
class osx::safari::enable_developer_mode {
  osx_default { 'enable developer mode':
    ensure => present,
    domain => 'com.apple.Safari',
    key    => 'IncludeDevelopMenu',
    type   => 'bool',
    value  => true,
    user   => lookup("workstation_user")
  }
}
