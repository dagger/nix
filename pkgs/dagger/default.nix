# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    x86_64-linux = "1m7kdwrramgfpykh48ijqbxb9b3mh0bgfhra8x5cyil4ksqjp6ya";
    armv7l-linux = "0bzh3x936pvdq627cqv9sbj8gnzgj0nfs0qcjqipc56r71npdhwf";
    aarch64-linux = "1p7wnbyag7qzrr9l5r7ghcp0sav5rhaakxfchhl4ai8a6k0zpc91";
    x86_64-darwin = "1kv5g97z02hcyn8h37cd17qj815wjhiilry86zvf5nvqjy4zxlpb";
    aarch64-darwin = "19b32f83bwri49vipi4kkrgn9lxi6bbikqxjhcl4p8vk3ivvm38c";
  };

  urlMap = {
    x86_64-linux = "https://dl.dagger.io/dagger/releases/0.11.9/dagger_v0.11.9_linux_amd64.tar.gz";
    armv7l-linux = "https://dl.dagger.io/dagger/releases/0.11.9/dagger_v0.11.9_linux_armv7.tar.gz";
    aarch64-linux = "https://dl.dagger.io/dagger/releases/0.11.9/dagger_v0.11.9_linux_arm64.tar.gz";
    x86_64-darwin = "https://dl.dagger.io/dagger/releases/0.11.9/dagger_v0.11.9_darwin_amd64.tar.gz";
    aarch64-darwin = "https://dl.dagger.io/dagger/releases/0.11.9/dagger_v0.11.9_darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "dagger";
  version = "0.11.9";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./dagger $out/bin/dagger
  '';
  postInstall = ''
    installShellCompletion --cmd dagger \
    --bash <($out/bin/dagger completion bash) \
    --fish <($out/bin/dagger completion fish) \
    --zsh <($out/bin/dagger completion zsh)
  '';

  system = system;

  meta = {
    description = "Dagger is an integrated platform to orchestrate the delivery of applications";
    homepage = "https://dagger.io";
    license = lib.licenses.asl20;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
