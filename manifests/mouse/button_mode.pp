# Public: Enable one or two button mode for multitouch mice
# (default = 1). Requires re-login.
class osx::mouse::button_mode($mode = 1) {
  $value = $mode ? {
    1 => 'OneButton',
    2 => 'TwoButton'
  }

  osx_default { 'Set the button mode for multitouch mice':
    user   => lookup("workstation_user"),
    domain => 'com.apple.driver.AppleBluetoothMultitouch.mouse',
    key    => 'MouseButtonMode',
    value  => $value,
    type   => 'string'
  }
}
