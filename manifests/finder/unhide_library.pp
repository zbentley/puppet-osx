# Public: Unhide ~/Library in Finder.
class osx::finder::unhide_library {
  $home = "/Users/${lookup('workstation_user')}"

  exec { 'Unhide ~/Library':
    command => "chflags nohidden ${home}/Library",
    onlyif  => "ls -Ol ${home} | grep Library | grep hidden";
  }
}
