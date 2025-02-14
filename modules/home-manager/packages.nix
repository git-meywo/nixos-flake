{ config, lib, pkgs, ... }:

{
  options = {
    home-package-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable some user packages.";
    };
  };

  config = lib.mkIf config.home-package-module.enable {
    home.packages = with pkgs; [
      neovim
      lazygit
      fastfetch
      starship
      vesktop
    ];
  };
}
