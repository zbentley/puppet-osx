# Public: Enable use of mousewheel for zooming.
class osx::universal_access::enable_scrollwheel_zoom {
  osx_default { 'Use mouse wheel (scroll gesture) to zoom':
    user   => lookup("workstation_user"),
    domain => 'com.apple.universalaccess',
    key    => 'closeViewScrollWheelToggle',
    value  => true;
  }
}
