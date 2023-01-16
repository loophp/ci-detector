[![GitHub Workflow Status][github workflow status]][github actions link]
[![Donate!][donate github]][github sponsors link]

# Nix CI Detector

This flake exposes and API to detect if Nix is run in a continuous
integration(CI) environment or not. This project has been inspired by
[OndraM/ci-detector][ondram/ci-detector] library for PHP.

## Usage

> **Warning:** Since detecting if we are in a CI or not rely on environment
> variables, we must add the flag `--impure` to the nix command.

In command line:

```shell
$ nix eval github:loophp/ci-detector#lib.inCI --impure
false
```

Now faking a Github actions environment by setting the `GITHUB_ACTIONS`
variable:

```shell
$ GITHUB_ACTIONS="FOOBAR" nix eval github:loophp/ci-detector#lib.inCI --impure
true
```

## API

This package contains a `flake.nix` which exposes an API.

Exposed API:

- `lib.ci`: When running in a CI, returns a `set` containing the current CI
  environment information, throws an error otherwise.
- `lib.inCI`: When running in a CI, returns `true`, `false` otherwise.
- `lib.notInCI`: When running in a CI, returns `false`, `true` otherwise.
- `lib.find`: Unary function where the first argument is a default value. When
  in a CI, the CI information is returned, otherwise the default value is
  returned.

To use it in your own package, take example on the following minimum working
example:

```nix
{
  description = "Simple example flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    ci-detector.url = "github:loophp/ci-detector";
  };

  outputs = { self, nixpkgs, flake-utils, ci-detector, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        ci = ci-detector.lib.find { name = "local"; };
      in
      {
        devShells.default = pkgs.mkShellNoCC {
          name = "${ci.name}-devshell";
        };
      });
}
```

[github actions link]: https://github.com/loophp/ci-detector/actions
[github sponsors link]: https://github.com/sponsors/drupol
[github workflow status]:
  https://img.shields.io/github/actions/workflow/status/loophp/ci-detector/tests.yml?branch=main&style=flat-square
[donate github]:
  https://img.shields.io/badge/Sponsor-Github-brightgreen.svg?style=flat-square
[ondram/ci-detector]: https://github.com/OndraM/ci-detector
