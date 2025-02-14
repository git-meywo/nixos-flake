{ config, lib, pkgs, ... }:

{
  options = {
    hyprland-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable Hyprland.";
    };
  };

  config = lib.mkIf config.hyprland-module.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };

    environment.sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };
}
