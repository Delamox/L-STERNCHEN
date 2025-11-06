flake:
{
  config,
  lib,
  pkgs,
  inputs,
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
      # inputs.elephant.packages.${system}.elephant-with-providers
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
