{ lib
}:

# Proudly found elsewhere: https://github.com/infinisil/system/blob/28a24dec87076a3b04abbae45693f696774ca739/config/new-modules/default.nix
let
  inherit (lib) collect filter hasSuffix isString concatStringsSep mapAttrs mapAttrsRecursive;

  # Recursively constructs an attrset of a given folder, recursing on directories, value of attrs is the filetype
  getDir = dir:
    mapAttrs
      (
        file: type:
          if type == "directory"
          then getDir "${dir}/${file}"
          else type
      )
      (builtins.readDir dir);

  # Collects all files of a directory as a list of strings of paths
  files = dir: collect isString (mapAttrsRecursive (path: type: concatStringsSep "/" path) (getDir dir));

  # Filters out directories that don't end with .nix or are this file, also makes the strings absolute
  validFiles = dir: map (file: ./. + "/${file}") (filter (file: hasSuffix ".nix" file && file != "default.nix" && ! lib.hasPrefix "x/taffybar/" file) (files dir));
in
{
  imports = validFiles ./.;
}
