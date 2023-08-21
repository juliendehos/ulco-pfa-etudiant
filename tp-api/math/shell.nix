let

  pkgs = import <nixpkgs> {};

  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; [
    aeson
    http-client-tls
    servant
    servant-client
    servant-server
    text
    text-show
    warp
  ]);

in pkgs.stdenv.mkDerivation {
  name = "my-haskell-env";
  buildInputs = [
    ghc 
  ];
  shellHook = "eval $(egrep ^export ${ghc}/bin/ghc)";
}


