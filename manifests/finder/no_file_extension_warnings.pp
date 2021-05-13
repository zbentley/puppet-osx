# Public: Disable file extension warnings.
class osx::finder::no_file_extension_warnings {
  include osx::finder

  osx_default { 'Disable file extension change warnings':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'FXEnableExtensionChangeWarning',
    value  => false,
    type   => 'bool',
    notify => Exec['killall Finder'];
  }
}