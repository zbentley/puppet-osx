# Public: Sets the dock position
#
# position - 'bottom', 'top', 'right', 'left'
#
# Examples
#
#   # set the position to be on the bottom
#   include osx::dock::position
#
#   # ...or pick your own position!
#   class { 'osx::dock::position':
#     position => 'left'
#   }
class osx::dock::position($position = 'right') {
  include osx::dock

  osx_default { 'position':
    domain => 'com.apple.dock',
    key    => 'orientation',
    type   => 'string',
    value  => $position,
    user   => lookup("workstation_user"),
    notify => Exec['killall Dock'];
  }
}
