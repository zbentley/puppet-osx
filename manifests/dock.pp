# Internal: Restart the Dock when necessary.
#
# Example
#
#   osx_default { 'Do a thing':
#     # ... other stuff here ...
#     notify => Exec['killall Dock'];
#   }
class osx::dock {
  exec { 'killall Dock':
    refreshonly => true
  }
}
