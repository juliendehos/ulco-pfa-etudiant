let

  pkgs = import <nixpkgs> {};

  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; [
    random
    stm
    websockets
  ]);

in pkgs.stdenv.mkDerivation {
  name = "my-haskell-env";
  buildInputs = [
    ghc 
  ];
  shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}

