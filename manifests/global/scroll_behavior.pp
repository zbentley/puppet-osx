# Set scroll bar behavior
class osx::global::scroll_behavior (
  $mode = 1
) {
  osx_default { 'Jump to spot that is clicked':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'AppleScrollerPagingBehavior',
    value  => $mode,
    type   => 'integer'
  }
}
