{ config, lib, pkgs, ... }:

{
  options = {
    home-gh-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable GitHub CLI on the system.";
    };
  };

  config = lib.mkIf config.home-gh-module.enable {
    programs.gh.enable = true;
  };
}
