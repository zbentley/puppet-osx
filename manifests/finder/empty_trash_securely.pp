# Public: Use Secure Empty Trash by default.
class osx::finder::empty_trash_securely {
  include osx::finder

  osx_default { 'Securely Empty Trash':
    user   => $::boxen_user,
    key    => 'EmptyTrashSecurely',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
