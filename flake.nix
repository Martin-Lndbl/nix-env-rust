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
              rustup
              rustc
              gnumake
              cargo
              python3
              github-cli
            ];

            shellHook = ''
            '';
          };
        }
      );
}
