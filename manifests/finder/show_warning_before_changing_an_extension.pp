# Public: Show warning before changing an extension.
class osx::finder::show_warning_before_changing_an_extension {
  include osx::finder

  osx_default { 'Show warning before changing an extension':
    user   => lookup("workstation_user"),
    key    => 'FXEnableExtensionChangeWarning',
    domain => 'com.apple.finder',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
