{ pkgs ? import <nixpkgs> {} }:
let drv = pkgs.haskellPackages.callCabal2nix "myjson" ./. {};
in if pkgs.lib.inNixShell then drv.env else drv

