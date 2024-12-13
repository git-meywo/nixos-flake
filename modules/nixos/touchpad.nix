{ config, lib, pkgs, ... }:

{
  options = {
    touchpad-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable touchpad support.";
    };
  };

  config = lib.mkIf config.touchpad-module.enable {
    services.libinput.enable = true;
  };
}
