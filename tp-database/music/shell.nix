let

  pkgs = import <nixpkgs> {};

  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; [
    aeson
    lucid
    sqlite-simple
    #postgresql-simple
    selda
    selda-sqlite
    #selda-postgresql
    scotty
    text
    text-show
  ]);

in pkgs.stdenv.mkDerivation {
  name = "my-haskell-env";
  buildInputs = [
    ghc 
  ];
  shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}
