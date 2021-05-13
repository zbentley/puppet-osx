# Enable OSX system firewall
class osx::security::firewall (
  $enabled = 1
) {
  osx_default { 'Configure firewall':
    user   => 'root',
    domain => '/Library/Preferences/com.apple.alf',
    key    => 'globalstate',
    value  => $enabled,
    type   => 'integer'
  }
}
