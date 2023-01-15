{nixpkgs}: let
  ci = nixpkgs.lib.lists.findSingle (x: x.isDetected) (throw "Not in CI") (throw "Not in CI") (map (x: import x) (import ./CI {inherit (nixpkgs) lib;}).imports);
in rec {
  inherit ci;

  inCI =
    if
      ((builtins.tryEval ci)
        == {
          success = false;
          value = false;
        })
    then false
    else true;
  notInCI = !inCI;
  find = default:
    if (true == inCI)
    then ci
    else default;
}
