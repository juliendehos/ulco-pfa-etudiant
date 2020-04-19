with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (haskellPackages.ghcWithHoogle (ps: with ps; [
      gloss
    ]))
  ];
}

