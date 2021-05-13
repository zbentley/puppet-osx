# Public: Disables Smart quotes and dashes
class osx::global::disable_smart_quotes {
  osx_default { 'Disable smart quotes':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticQuoteSubstitutionEnabled',
    value  => false,
    user   => $::boxen_user;
  }

  osx_default { 'Disable smart dashes':
    ensure => present,
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticDashSubstitutionEnabled',
    value  => false,
    user   => $::boxen_user;
  }
}
