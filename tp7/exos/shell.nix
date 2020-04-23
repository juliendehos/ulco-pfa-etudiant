with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (ps: with ps; [
      aeson
      bytestring
      hakyll
      optparse-generic
      optparse-applicative
      pandoc
      scalpel
      text
    ]))
  ];
}

