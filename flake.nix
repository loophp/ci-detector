{
  description = "To detect whether we are in a CI or not";

  inputs = {
    nixpkgs-lib.url = "github:nix-community/nixpkgs.lib";
  };

  outputs = { self, nixpkgs-lib }: {
    lib = import ./src/lib.nix { inherit (nixpkgs-lib) lib; };
  };
}
