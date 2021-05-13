# Public: Expands Print panel by default.
class osx::global::expand_print_dialog {
  osx_default { 'Expand print panel by default':
    user   => lookup("workstation_user"),
    key    => 'PMPrintingExpandedStateForPrint',
    domain => 'NSGlobalDomain',
    value  => true;
  }
}
