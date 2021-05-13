# Public: Disables the dock by setting a long autohide-delay
class osx::dock::disable {
  include osx::dock

  osx_default { 'Disable the dock':
    user   => lookup("workstation_user"),
    key    => 'autohide-delay',
    type   => 'float',
    domain => 'com.apple.dock',
    value  => 999999,
    notify => Exec['killall Dock'];
  }
}
