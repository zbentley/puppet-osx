# Public: Show all filename extensions.
class osx::finder::show_all_filename_extensions {
  include osx::finder

  osx_default { 'Show all filename extensions':
    user   => lookup("workstation_user"),
    key    => 'AppleShowAllExtensions',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
