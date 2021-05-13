# Public: Sets default path for new finder windows
#
# Examples
#
#   # Set default path to ~/
#   include osx::finder::default_path
#
#   # Or pick the location yourself
#   class { 'osx::finder::default_path':
#     path => '/your/path/here'
#   }
#

class osx::finder::default_path(
  $path = "file:///Users/${lookup('workstation_user')}"
) {
  osx_default { 'Set Finder default path type':
    user   => lookup("workstation_user"),
    domain => 'com.apple.finder',
    key    => 'NewWindowTarget',
    value  => 'PfLo',
    type   => 'string'
  }

  osx_default { 'Set Finder default path':
    user   => lookup("workstation_user"),
    domain => 'com.apple.finder',
    key    => 'NewWindowTargetPath',
    value  => $path,
    type   => 'string'
  }
}
