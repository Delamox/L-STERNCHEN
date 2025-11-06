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
  # elephantPackage = inputs.elephant.packages.${pkgs.stdenv.system}.elephant-with-providers;
in
{
  options.programs.L-STERNCHEN = {
    enable = mkEnableOption "Signalis themed desktop shell";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [flake.packages.${pkgs.stdenv.system}.L-STERNCHEN];
    # environment.etc."xdg/elephant/providers" = {
    #   source = "${elephantPackage}/lib/elephant/providers";
    # };
    services.elephant.enable = true;
    services = {
      upower.enable = true;
      playerctld.enable = true;
    };
  };
}
