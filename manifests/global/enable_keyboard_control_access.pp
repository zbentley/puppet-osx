# Public: Enables keyboard access for dialog controls.
class osx::global::enable_keyboard_control_access {
  osx_default { 'Enable full keyboard access for all controls':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'AppleKeyboardUIMode',
    value  => 3,
    user   => lookup("workstation_user");
  }
}

