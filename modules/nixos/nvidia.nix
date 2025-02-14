{ config, lib, pkgs, ... }:

{
  options = {
    nvidia-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable Nvidia drivers and options.";
    };
  };

  config = lib.mkIf config.nvidia-module.enable {

    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
    };
  };
}
