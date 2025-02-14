{ config, lib, pkgs, ... }:

{
  options = {
    flatpak-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable Flatpak.";
    };
  };

  config = lib.mkIf config.flatpak-module.enable {
    services.flatpak.enable = true;
  };
}
