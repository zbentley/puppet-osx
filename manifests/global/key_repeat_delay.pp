# Public: Sets the delay before held keys repeat.
#
# delay - ms before key starts repeating. Defaults to 35.
#
# Examples
#
#   # set the repeat delay to 35 (the default)...
#   include osx::global::key_repeat_delay
#
#   # ...or pick your own delay!
#   class { 'osx::global::key_repeat_delay':
#     delay => 10
#   }
class osx::global::key_repeat_delay($delay = 35) {
  osx_default { 'key repeat delay':
    domain => 'NSGlobalDomain',
    type   => 'int',
    key    => 'InitialKeyRepeat',
    value  => $delay,
    user   => lookup("workstation_user")
  }
}
