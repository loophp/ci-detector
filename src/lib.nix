{ nixpkgs }:

let
  CIs = map (x: import x) (import ./CI { inherit (nixpkgs) lib; }).imports;
  ci = nixpkgs.lib.lists.findSingle (x: x.isDetected) (throw "Not in CI") (throw "Not in CI") CIs;
  inCI = if false == (nixpkgs.lib.lists.findSingle (x: x.isDetected) false false CIs) then false else true;
in
{
  inherit ci inCI;

  notInCI = if (true == inCI) then false else true;
  find = default: if (true == inCI) then ci else default;
}
