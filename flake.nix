{
  description = "Agda presentation of quotient types";

  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, flake-utils, nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
    let pkgs = import nixpkgs { inherit system; };
        agda-p = pkgs.agda.withPackages (p: with p; [cubical]);
    in rec {
      packages.thesis = with pkgs;
        stdenv.mkDerivation {
          name = "agda-quotient-types";
          src = ./.;
          buildInputs = [
            which
            agda-p
            (texlive.combine {
                inherit (texlive)
                  scheme-full
                ;
              })
          ];
        };
      defaultPackage = packages.thesis;
    });
}
