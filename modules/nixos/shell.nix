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
        # Remove the auto-generated text
        set fish_greeting

        # Run Fastfetch
        fastfetch

        # Setup Starship
        starship init fish | source
      '';
    };
  };
}
