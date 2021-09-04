{ pkgs ? import <nixpkgs> {} }:
let drv = pkgs.haskellPackages.callCabal2nix "echo-servant" ./. {};
in if pkgs.lib.inNixShell then drv.env else drv

