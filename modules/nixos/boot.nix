{ config, lib, pkgs, ... }:

{
  options = {
    boot-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable the boot module.";
    };
  };

  config = lib.mkIf config.boot-module.enable {
    boot.loader = {
      grub = {
        enable = true;
        efiSupport = true;
        configurationLimit = 100;
        device = "nodev";
      };
      efi.canTouchEfiVariables = true;
    };
  };
}
