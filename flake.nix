{
  description = "Signalis themed desktop shell";
  #largely copied from readf0x because I am too lazy to do it myself.

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, quickshell }: let
    lib = nixpkgs.lib;
    perSystem = package: (lib.listToAttrs (lib.map (a: { name = a; value = package { pkgs = nixpkgs.legacyPackages.${a}; system = a; }; }) (lib.attrNames nixpkgs.legacyPackages)));
    makeQmlPath = pkgs: lib.makeSearchPath "lib/qt-6/qml" (map (path: "${path}") pkgs);
    qmlPath = pkgs: makeQmlPath [
      quickshell.packages.${pkgs.system}.default
      pkgs.kdePackages.qtshadertools
      pkgs.kdePackages.qtdeclarative
    ];
  in {
    packages = perSystem ({ pkgs, system }: rec {
      L-STERNCHEN-config = pkgs.stdenv.mkDerivation (finalAttrs: {
        pname = "L-STERNCHEN";
        version = "v1";

        src = ./.;

        dontBuild = true;

        installPhase = ''
          mkdir $out
          cp -r * $out
        '';
      });
      app2unit = pkgs.stdenv.mkDerivation {
        pname = "app2unit";
        version = "0-unstable-2025-04-03";

        src = pkgs.fetchFromGitHub {
          owner = "Vladimir-csp";
          repo = "app2unit";
          rev = "44b5da8a6f1e5449d3c2a8b63dc54875bb7e10af";
          hash = "sha256-SJVGMES0tmdAhh2u8IpGAITtSnDrgSfOQbDX9RhOc/M=";
        };

        buildInputs = with pkgs; [
          coreutils
          xdg-terminal-exec
          libnotify
        ];

        installPhase = ''
          mkdir -p $out/bin
          cp app2unit $out/bin
        '';

        meta = {
          description = "A simple app launcher for X11 and Wayland";
          homepage = "https://github.com/Vladimir-csp/app2unit";
          mainProgram = "app2unit";
          license = lib.licenses.gpl3Plus;
          platforms = lib.platforms.linux;
        };
      };
      L-STERNCHEN = let
        dependencies = [ pkgs.cava app2unit quickshell.packages.${system}.default ];
      in pkgs.writeShellScriptBin "L-STERNCHEN" ''
        if ! [ $QS_CONFIG_PATH ]; then
          export QS_CONFIG_PATH=${L-STERNCHEN-config}
        fi
        export PATH="${lib.makeBinPath dependencies}:$PATH"
        export QML2_IMPORT_PATH="${qmlPath pkgs}"
        ${quickshell.packages.${system}.default}/bin/quickshell $@
      '';
      default = L-STERNCHEN;
    });
    devShells = perSystem ({ pkgs, system }: {
      default = pkgs.mkShell {
        packages = [
          pkgs.cava
          self.packages.${system}.default
        ];

        QML2_IMPORT_PATH = qmlPath pkgs;

        shellHook = ''
          export QS_CONFIG_PATH="$(pwd)/src"
        '';
      };
    });
  };
}
