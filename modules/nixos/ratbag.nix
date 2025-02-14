{ config, lib, pkgs, ... }:

{
  options = {
    ratbag-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable ratbagd, which is necessary for Piper.";
    };
  };

  config = lib.mkIf config.ratbag-module.enable {
    services.ratbagd.enable = true;
  };
}
