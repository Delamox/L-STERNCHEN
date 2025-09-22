{
  description = "Signalis themed desktop shell";
  #largely copied from readf0x because I am too lazy to do it myself.

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    elephant = {
      url = "github:abenz1267/elephant";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, quickshell, elephant }: let
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
      L-STERNCHEN = let
        dependencies = [ pkgs.cava pkgs.uwsm quickshell.packages.${system}.default elephant.packages.${system}.elephant];
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
          pkgs.uwsm
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
