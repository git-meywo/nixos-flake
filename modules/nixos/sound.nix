{ config, lib, pkgs, ... }:

{
  options = {
    sound-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable sound.";
    };
  };

  config = lib.mkIf config.sound-module.enable {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
