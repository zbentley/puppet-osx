# Public: Enables Ctrl-scroll to zoom.
class osx::universal_access::ctrl_mod_zoom {
  osx_default { 'Use scroll gesture with the Ctrl (^) key to zoom':
    user   => $::boxen_user,
    domain => 'com.apple.universalaccess',
    key    => 'HIDScrollZoomModifierMask',
    value  => 262144;
  }
}
