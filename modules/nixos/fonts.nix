{ config, lib, pkgs, ... }:

{
  options = {
    fonts-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable fonts.";
    };
  };

  config = lib.mkIf config.fonts-module.enable {
    fonts.packages = with pkgs; [
      nerdfonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
    ];
  };
}
