# Public: Disables keyboard press-and-hold for accented character entry.
class osx::global::disable_key_press_and_hold {
  osx_default { 'Disable press-and-hold for accented characters':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'ApplePressAndHoldEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
