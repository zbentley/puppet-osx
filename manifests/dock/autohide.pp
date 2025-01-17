# Public: Causes the dock to hide itself when you're not pointing at it.
class osx::dock::autohide {
  include osx::dock

  osx_default { 'Automatically hide the dock':
    user   => lookup("workstation_user"),
    key    => 'autohide',
    domain => 'com.apple.dock',
    value  => true,
    notify => Exec['killall Dock'];
  }
}
