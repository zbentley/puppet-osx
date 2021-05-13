# Public: Disable creation of .DS_Store files on network drives.
class osx::no_network_dsstores {
  osx_default { 'Do not create .DS_Store on network shares':
    key    => 'DSDontWriteNetworkStores',
    domain => 'com.apple.desktopservices',
    value  => true,
    user   => lookup("workstation_user")
  }
}
