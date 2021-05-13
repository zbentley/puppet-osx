# Public: Manages interface sound effects
class osx::sound::interface_sound_effects (
  $enable = true
) {

  $value = $enable ? {
    false   => 0,
    default => 1
  }

  osx_default { 'Manage interface sound effects':
    user   => lookup("workstation_user"),
    key    => 'com.apple.sound.uiaudio.enabled',
    domain => 'com.apple.systemsound',
    value  => $value,
  }
}
