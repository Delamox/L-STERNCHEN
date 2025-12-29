{
  description = "Signalis themed desktop shell";
  #largely copied from readf0x because I am too lazy to do it myself.

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    elephant = {
      url = "github:abenz1267/elephant?ref=2.0.0";
    };
  };

  outputs = { self, nixpkgs, ... }: let
    lib = nixpkgs.lib;
    perSystem = package: (lib.listToAttrs (lib.map (a: { name = a; value = package { pkgs = nixpkgs.legacyPackages.${a}; system = a; }; }) (lib.attrNames nixpkgs.legacyPackages)));
    makeQmlPath = pkgs: lib.makeSearchPath "lib/qt-6/qml" (map (path: "${path}") pkgs);
    qmlPath = pkgs: makeQmlPath [
      pkgs.quickshell
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
        dependencies = with pkgs; [
          cava
          quickshell
        ];
      in pkgs.writeShellScriptBin "L-STERNCHEN" ''
        if ! [ $QS_CONFIG_PATH ]; then
          export QS_CONFIG_PATH=${L-STERNCHEN-config}
        fi
        export PATH="${lib.makeBinPath dependencies}:$PATH"
        export QML2_IMPORT_PATH="${qmlPath pkgs}"
        ${pkgs.quickshell}/bin/quickshell $@
      '';
      default = L-STERNCHEN;
    });
    nixosModules = {
      default = self.nixosModules.L-STERNCHEN;
      L-STERNCHEN = import ./nix/modules/default.nix self;
    };
  };
}
