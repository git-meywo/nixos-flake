{ config, pkgs, ... }:

{

  imports =
    [
      ../../modules/home-manager/dotfiles.nix
      ../../modules/home-manager/git.nix
      ../../modules/home-manager/gh.nix
      ../../modules/home-manager/packages.nix
    ];

  # Basic Home manager info:
  home.username = "meywo";
  home.homeDirectory = "/home/meywo";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}
