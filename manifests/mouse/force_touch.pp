# Public: Controls Force Touch
class osx::mouse::force_touch(
  $enabled = true
) {

  $haptic_value = $enabled ? {
    false => 0,
    true  => 1
  }

  osx_default { 'Toggle haptic feedback for Force Touch':
    user   => $::boxen_user,
    domain => 'com.apple.AppleMultitouchTrackpad',
    key    => 'ActuateDetents',
    value  => $haptic_value,
    type   => 'integer'
  }

  $force_value = $enabled ? {
    false => 1,
    true  => 0
  }

  osx_default { 'Toggle force supression for Force Touch':
    user   => $::boxen_user,
    domain => 'com.apple.AppleMultitouchTrackpad',
    key    => 'ForceSuppressed',
    value  => $force_value,
    type   => 'integer'
  }
}
