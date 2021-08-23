with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (ps: with ps; [
      aeson
      servant
      servant-client
      servant-lucid
      servant-server
      text
      warp
    ]))
  ];
}

