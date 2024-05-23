{
  description = "Home shell.";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/2fd19c8be2551a61c1ddc3d9f86d748f4db94f00";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        # stdenv-overlay = final: prev: {
        #   stdenv = prev.stdenv.override {
        #     NIX_LDFLAGS = " -l${prev.stdenv.cc.libcxx.cxxabi.libName}";
        #    };
        # };
        pkgs = import nixpkgs { inherit system; overlays = []; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            go
            duckdb
            google-cloud-sdk
          ];
          shellHook = ''
            export PATH="$HOME/.bin:$HOME/go/bin:$PATH"
          '';
        };
      }
    );
}
