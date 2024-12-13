{ config, lib, pkgs, ... }:

{
  options = {
    networking-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable the networking module.";
    };
    networking-module.hostname = lib.mkOption {
      type = lib.types.str;
      default = "unnamed-nixos-machine";
      example = "nixos-pc";
      description = "Set the hostname for networking.";
    };
  };

  config = lib.mkIf config.networking-module.enable {
    networking = {
      hostName = config.networking-module.hostname;
      networkmanager.enable = true;
    };
  };
}
