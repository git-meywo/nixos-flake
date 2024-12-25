{ config, lib, pkgs, ... }:

{
  options = {
    locale-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable the locale module.";
    };
  };

  config = lib.mkIf config.locale-module.enable {
    time.timeZone = "Europe/Paris";
    i18n.defaultLocale = "en_US.UTF-8";
  };
}
