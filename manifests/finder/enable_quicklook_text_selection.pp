# Public: Enables text selection on Quick Look preview windows
class osx::finder::enable_quicklook_text_selection {
  include osx::finder

  osx_default { 'Enable Quick Look text selection':
    user   => $::boxen_user,
    domain => 'com.apple.finder',
    key    => 'QLEnableTextSelection',
    value  => true,
    notify => Exec['killall Finder'];
  }
}
