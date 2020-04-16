{ pkgs ? import <nixpkgs> {} }:

let

  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; [
    gloss
  ]);

in pkgs.stdenv.mkDerivation {
  name = "my-haskell-env-0";
  buildInputs = [ ghc ];
  shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}

