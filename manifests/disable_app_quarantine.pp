# Public: Disable the App Quarantine feature so you can run apps you download.
class osx::disable_app_quarantine {
  osx_default { 'Disable the downloaded app quarantine':
    user   => $::boxen_user,
    key    => 'LSQuarantine',
    domain => 'com.apple.LaunchServices',
    value  => false;
  }
}
