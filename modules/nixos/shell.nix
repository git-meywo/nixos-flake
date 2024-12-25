{ config, lib, pkgs, ... }:

{
  options = {
    shell-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable fish shell.";
    };
  };

  config = lib.mkIf config.shell-module.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = ''
        # Remove the fish greeting message
        set fish_greeting

        # Fastfetch
        fastfetch
      '';
    };
  };
}
