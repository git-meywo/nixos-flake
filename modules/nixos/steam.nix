{ config, lib, pkgs, ... }:

{
  options = {
    steam-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable Steam.";
    };
  };

  config = lib.mkIf config.steam-module.enable {
    programs = {
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        localNetworkGameTransfers.openFirewall = true;
      };
      gamemode.enable = true;
    };
  };
}
