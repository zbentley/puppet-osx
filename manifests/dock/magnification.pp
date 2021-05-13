# Public: Sets dock icon magnification
#
# Examples
#
#   # Set dock icon magnification to true, with 128px magnified icons
#   include osx::dock::magnification
#
#   # ...or manage the icon size yourself!
#   class { 'osx::dock::magnification':
#     magnification => [true|false]
#     magnification_size => [16-128]
#   }
#
#


class osx::dock::magnification (
  $magnification = true,
  $magnification_size = '128'
){
  include osx::dock

  osx_default { 'magnification':
    domain => 'com.apple.dock',
    key    => 'magnification',
    type   => 'bool',
    value  => $magnification,
    user   => lookup("workstation_user"),
    notify => Exec['killall Dock'];
  }

  osx_default { 'magnification_size':
    domain => 'com.apple.dock',
    key    => 'largesize',
    type   => int,
    value  => $magnification_size,
    user   => lookup("workstation_user"),
    notify => Exec['killall Dock'];
  }

}
