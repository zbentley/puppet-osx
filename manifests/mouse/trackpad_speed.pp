# Public: Sets movement speed for trackpad
class osx::mouse::trackpad_speed(
  $speed = 6
) {
  osx_default { 'Set trackpad speed':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.trackpad.scaling',
    value  => $speed,
    type   => 'integer'
  }
}
