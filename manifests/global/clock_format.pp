# Set clock format for menu bar
class osx::global::clock_format(
  $format = 'EEE MMM d  H:mm:ss'
) {
  osx_default { 'Configure clock format string':
    user   => lookup("workstation_user"),
    domain => 'com.apple.menuextra.clock',
    key    => 'DateFormat',
    value  => $format,
    type   => 'string'
  }
}
