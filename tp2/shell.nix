{ pkgs ? import <nixpkgs> {} }:

let

  ghc = pkgs.haskellPackages.ghcWithPackages (ps: with ps; [
    haskell-gi
    gi-gtk
  ]);

in pkgs.stdenv.mkDerivation {
  name = "my-haskell-env-0";
  buildInputs = [ ghc ];
  shellHook = ''
    eval $(egrep ^export ${ghc}/bin/ghc)
    export XDG_DATA_DIRS=${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:$XDG_DATA_DIRS
  '';
}

