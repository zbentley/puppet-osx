# Public: Sets the icons's size
class osx::dock::icon_size($size = 36) {
  include osx::dock

  osx_default { 'icon size':
    domain => 'com.apple.dock',
    key    => 'tilesize',
    type   => 'int',
    value  => $size,
    user   => $::boxen_user,
    notify => Exec['killall Dock'];
  }
}
