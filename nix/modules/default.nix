flake:
{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.L-STERNCHEN;
  system = pkgs.stdenv.system;
in
{
  options.programs.L-STERNCHEN = {
    enable = mkEnableOption "Signalis themed desktop shell";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [
      flake.packages.${system}.L-STERNCHEN
    ];
    
    services = {
      elephant = {
        enable = true;
        installService = false;
      };
      upower.enable = true;
      playerctld.enable = true;
    };
  };
}
