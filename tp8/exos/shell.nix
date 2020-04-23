with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (haskellPackages.ghcWithHoogle (ps: with ps; [
      aeson
      bytestring
      hakyll
      lucid
      optparse-applicative
      pandoc
      scalpel
      text
      text-show
    ]))
  ];
}

