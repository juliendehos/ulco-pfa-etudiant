{ pkgs ? import <nixpkgs> {} }:
let drv = pkgs.haskellPackages.callCabal2nix "html2md" ./. {};
in if pkgs.lib.inNixShell then drv.env else drv

