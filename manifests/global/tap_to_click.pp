# Public: Enables Tap to click
class osx::global::tap_to_click {
  osx_default { 'Tap-To-Click Bluetooth':
    ensure => present,
    domain => 'com.apple.driver.AppleBluetoothMultitouch.trackpad',
    key    => 'Clicking',
    value  => true,
    type   => bool,
    user   => $::boxen_user;
  }

  osx_default { 'Tap-To-Click Mouse':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    value  => 1,
    type   => int,
    user   => $::boxen_user;
  }

  osx_default { 'Tap-To-Click Current Host':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'com.apple.mouse.tapBehavior',
    value  => 1,
    type   => int,
    host   => 'currentHost',
    user   => $::boxen_user;
  }

  osx_default { 'Tap-to-Click new trackpad':
    domain => 'com.apple.AppleMultitouchTrackpad',
    key    => 'Clicking',
    value  => 1,
    type   => int,
    user   => $::boxen_user
  }
}
