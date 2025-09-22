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
  elephantPackage = flake.packages.${system}.elephant-with-providers;
in
{
  options.programs.L-STERNCHEN = {
    enable = mkEnableOption "Signalis themed desktop shell";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = [cfg.package];
    environment.etc."xdg/elephant/providers" = {
      source = "${elephantPackage}/lib/elephant/providers";
    };
  };
}
