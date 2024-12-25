{ config, lib, pkgs, ... }:

{
  options = {
    hardware-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable the hardware module (enables OpenGL).";
    };
  };

  config = lib.mkIf config.hardware-module.enable {
    hardware.graphics.enable = true;
  };
}
