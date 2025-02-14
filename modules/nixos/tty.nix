{ config, lib, pkgs, ... }:

{
  options = {
    tty-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to set some NECESSARY tty options.";
    };
  };

  config = lib.mkIf config.tty-module.enable {
    console = {
      keyMap = "fr";
    };
  };
}
