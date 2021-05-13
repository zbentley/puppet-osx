# Set view style for finder windows
class osx::finder::view_style(
  $style = 'Nlsv'
) {
  osx_default { 'Set view style in finder':
    user   => lookup("workstation_user"),
    domain => 'com.apple.Finder',
    key    => 'FXPreferredViewStyle',
    value  => $style,
    type   => 'string'
  }
}
