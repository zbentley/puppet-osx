# Public: Show mounted servers on the desktop.
class osx::finder::show_mounted_servers_on_desktop {
  include osx::finder

  osx_default { 'Show mounted servers on the desktop':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'ShowMountedServersOnDesktop',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
