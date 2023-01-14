{nixpkgs}: let
  ci = nixpkgs.lib.lists.findSingle (x: x.isDetected) (throw "Not in CI") (throw "Not in CI") (map (x: import x) (import ./CI {inherit (nixpkgs) lib;}).imports);
in {
  inCI =
    if tryEval ci
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
