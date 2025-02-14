{ config, lib, pkgs, ... }:

{
  options = {
    home-git-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable git on the system.";
    };
  };

  config = lib.mkIf config.home-git-module.enable {
    programs.git = {
      enable = true;
      userName = "git-meywo";
      userEmail = "rubyboulon@proton.me";
      extraConfig.init.defaultBranch = "main";
    };
  };
}
