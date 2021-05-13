# Public: Enable/disable swipe between pages for multitouch mice
# (default = disabled). Requires re-login.
class osx::mouse::swipe_between_pages($enabled = false) {
  osx_default { 'Enable swipe between pages for multitouch mice':
    user   => lookup("workstation_user"),
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableMouseSwipeNavigateWithScrolls',
    value  => $enabled,
    type   => 'boolean'
  }
}
