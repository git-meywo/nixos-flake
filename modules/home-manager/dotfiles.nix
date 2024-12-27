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
      ".config/hypr".source  = ./dotfiles/hypr;
      ".config/kitty".source = ./dotfiles/kitty;
      ".config/fastfetch".source = ./dotfiles/fastfetch;
      ".local/share/icons/HyprBibataModernClassicSVG".source = ./dotfiles/hyprcursor/HyprBibataModernClassicSVG;
      "dotfile-assets".source = ./dotfiles/dotfile-assets;
    };
  };
}
