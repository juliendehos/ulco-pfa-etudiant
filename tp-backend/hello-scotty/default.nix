{ pkgs ? import <nixpkgs> {} }:
let drv = pkgs.haskellPackages.callCabal2nix "hello-scotty" ./. {};
in if pkgs.lib.inNixShell then drv.env else drv

