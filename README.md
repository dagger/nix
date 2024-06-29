# nur-packages

**Dagger [NUR](https://github.com/nix-community/NUR) repository**

<!-- Remove this if you don't use github actions -->
![Build and populate cache](https://github.com/dagger/nix/workflows/Build%20and%20populate%20cache/badge.svg)

This is updated by [GoReleaser
Nixpkgs](https://goreleaser.com/customization/nix/) from within the
[dagger/dagger](https://github.com/dagger/dagger/blob/v0.11.7/.goreleaser.yml#L31-L48)
repository. GoReleaser runs in a `dagger` pipeline - [see the
code](https://github.com/dagger/dagger/blob/v0.11.7/ci/cli.go#L158-L172). The
entire release process - including this Nix flake - is captured in Dagger's
[RELEASING
documentation](https://github.com/dagger/dagger/blob/v0.11.7/RELEASING.md). If
you have more questions, [you can find us in our `#nix` Discord
channel](https://discord.com/channels/707636530424053791/1122966469425233940) 👋

## Usage

### As flake

```nix
{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    dagger.url = "github:dagger/nix";
    dagger.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, dagger, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [ dagger.packages.${system}.dagger ];
        };
      });
}
```
