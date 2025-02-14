{ config, lib, pkgs, ... }:

{
  options = {
    fonts-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to install fonts.";
    };
  };

  config = lib.mkIf config.fonts-module.enable {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
    ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
  };
}
