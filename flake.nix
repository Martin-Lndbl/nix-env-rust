{
  description = "Rust development environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-23.05";
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

            buildInputs = with pkgs; [
              rustc
              gnumake
              cargo

              # tests
              python3

              # gradereport script
              github-cli

              gdb
              # task 1
              # rustup

              # task 2
              # fuse
              # pkg-config

              # task 3
              # flex
              # bison

              # task 6
              # protobuf

              # tast 7
              # gflags
              # bashInteractive
              # linuxKernel.packages.linux_xanmod.perf

              # task 9
              llvmPackages_16.llvm
              llvmPackages_16.clang-unwrapped
              lit
              cmake
              ninja
              libxml2
            ];

            shellHook = ''
            '';
          };
        }
      );
    }
