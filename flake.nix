{
  description = "Rust development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            # overlays = [
            #  (self: super: {
            #    bash = super.bash.overrideAttrs (oldAttrs: {
            #      configureFlags = oldAttrs.configureFlags
            #        ++ [ "--without-bash-malloc" ];
            #    });
            #  })
            # ];
          };
        in
        {
          devShell = pkgs.mkShell {

            nativeBuildInputs = with pkgs; [
              rustc
              gnumake
              cargo

              pkg-config

              # tests
              python3

              # gradereport script
              github-cli

              # task 1
              # rustup

              # task 2
              # fuse

              # task 3
              flex
              bison

            ];

            shellHook = ''
            '';
          };
        }
      );
}
