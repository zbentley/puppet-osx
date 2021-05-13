# Public: Dim backlight after inactivity (Delay set in seconds)
class osx::keyboard::dim_backlight(
  $delay = 10
) {
  osx_default { "Dim keyboard after ${delay} seconds of inactivity":
    user   => $::boxen_user,
    domain => 'com.apple.BezelServices',
    key    => 'kDimTime',
    value  => $delay,
    type   => 'integer'
  }
}
