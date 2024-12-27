{ config, lib, pkgs, ... }:

{
  options = {
    packages-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to install basic system packages, this should always be set to true.";
    };
  };

  config = lib.mkIf config.packages-module.enable {
    environment.systemPackages = with pkgs; [
      kitty
      vim
      hyprpanel
      hyprpicker
      hyprcursor
      hyprpaper
      hyprlock
      rofi-wayland
      wl-clipboard

      inputs.zen-browser.packages."${system}".specific
    ];
  };
}
