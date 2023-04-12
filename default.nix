let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.5.0";
  }) {
    # optionally bring your own nixpkgs
    pkgs = import <nixpkgs> { };

    # optionally specify the python version
    python = "python38";

    # optionally update pypi data revision from https://github.com/DavHau/pypi-deps-db
    # pypiDataRev = "some_revision";
    # pypiDataSha256 = "some_sha256";
  };
in let
  pyEnv = mach-nix.mkPython rec {

    requirements = ''
      pyparsing
    '';

  };
in mach-nix.nixpkgs.mkShell {

  buildInputs = [ pyEnv mach-nix.nixpkgs.graphviz ];

}
