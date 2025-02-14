{ config, lib, pkgs, inputs, ... }:

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
      mangohud
      hyprpaper
      hyprlock
      hyprcursor
      waybar
      rofi-wayland
      dunst
      libgcc
      curl
      fzf
      ripgrep
      fd
      swappy
      slurp
      grim
      wl-clipboard
      hyprland-qtutils
      piper
      btop
    ];
  };
}
