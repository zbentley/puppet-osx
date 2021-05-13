# Public: Expand the Save panel by default.
class osx::global::expand_save_dialog {
  osx_default { 'Expand save panel by default':
    user   => lookup("workstation_user"),
    key    => 'NSNavPanelExpandedStateForSaveMode',
    domain => 'NSGlobalDomain',
    value  => true;
  }
}
