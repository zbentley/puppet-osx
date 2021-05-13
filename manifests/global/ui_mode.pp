# Enable dark-mode in the UI
class osx::global::ui_mode (
  $mode = 'Dark'
) {
  osx_default { 'Set UI mode':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleInterfaceStyle',
    value  => $mode,
    type   => 'string'
  }
}
