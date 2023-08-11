{ nixpkgs
}:

let
  ci = nixpkgs.lib.lists.findSingle (x: x.isDetected) (throw "Not in CI") (throw "Not in CI") (map (x: import x) (import ./CI { inherit (nixpkgs) lib; }).imports);
  inCI = (builtins.tryEval ci).success;
in
{
  inherit ci inCI;

  notInCI = !inCI;

  find = default: if inCI then ci else default;
}
