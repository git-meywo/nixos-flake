{ config, lib, pkgs, ... }:

{
  options = {
    home-dotfile-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to declaratively set dotfiles in ~/.config/.";
    };
  };

  config = lib.mkIf config.home-dotfile-module.enable {
    home.file = {
      ".config/fastfetch".source = ./dotfiles/fastfetch;
      ".config/kitty".source = ./dotfiles/kitty;
      ".config/hypr/hyprland.conf".source = ./dotfiles/hyprland/hyprland.conf;
      ".config/hypr/hyprpaper.conf".source = ./dotfiles/hyprpaper/hyprpaper.conf;
      ".config/wallpaper/wallpaper.png".source = ./dotfiles/wallpaper/wallpaper.png;
    };
  };
}
