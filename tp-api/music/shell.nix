with import <nixpkgs> {};

mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (ps: with ps; [
      aeson
      http-client-tls
      scotty
      servant
      servant-client
      servant-lucid
      servant-server
      text
      warp
    ]))
  ];
}

