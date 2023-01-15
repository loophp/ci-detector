{nixpkgs}: let
  ci = nixpkgs.lib.lists.findSingle (x: x.isDetected) (throw "Not in CI") (throw "Not in CI") (map (x: import x) (import ./CI {inherit (nixpkgs) lib;}).imports);
in rec {
  inCI =
    if ((builtins.tryEval ci) == { success = false; value = false; })
    then false
    else true;
  notInCI =
    if inCI
    then false
    else true;
  find = default:
    if (true == inCI)
    then ci
    else default;
}
