# Public: Show Hidden Files by default.
class osx::finder::show_hidden_files {
  include osx::finder

  osx_default { 'Show Hidden Files':
    user   => $::boxen_user,
    key    => 'AppleShowAllFiles',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
