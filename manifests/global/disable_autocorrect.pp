# Public: Disables spelling autocorrect.
class osx::global::disable_autocorrect {
  osx_default { 'Disable autocorrect':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticSpellingCorrectionEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
