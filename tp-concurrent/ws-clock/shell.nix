with import <nixpkgs> {};
mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (ps: with ps; [
      random
      websockets
    ]))
  ];
}

