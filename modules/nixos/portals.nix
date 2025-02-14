{ config, lib, pkgs, ... }:

{
  options = {
    portals-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable some desktop portals.";
    };
  };

  config = lib.mkIf config.portals-module.enable {
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
}
