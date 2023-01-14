{
  description = "To detect whether we are in a CI or not";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    lib = import ./src/lib.nix {inherit nixpkgs;};
  };
}
