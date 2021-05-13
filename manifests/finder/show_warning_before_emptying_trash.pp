# Public: Show warning before emptying the trash.
class osx::finder::show_warning_before_emptying_trash {
  include osx::finder

  osx_default { 'Show warning before emptying the trash':
    user   => $::boxen_user,
    key    => 'WarnOnEmptyTrash',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
