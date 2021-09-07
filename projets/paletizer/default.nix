{ pkgs ? import <nixpkgs> {} }:
let drv = pkgs.haskellPackages.callCabal2nix "paletizer" ./. {};
in if pkgs.lib.inNixShell then drv.env else drv

