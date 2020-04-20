with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (ps: with ps; [
      filepath
      hakyll
    ]))
    cabal-install
    pandoc
    texlive.combined.scheme-small
  ];
}

