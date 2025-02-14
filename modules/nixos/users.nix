{ config, lib, pkgs, ... }:

{
  options = {
    users-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether set users on the machine, should always be set to true.";
    };
  };

  config = lib.mkIf config.users-module.enable {
    users.users.meywo = {
      isNormalUser = true;
      extraGroups = [ "wheel" "gamemode" ];
      shell = pkgs.fish;
    };
  };
}
