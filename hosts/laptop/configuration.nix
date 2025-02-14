{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/boot.nix
      ../../modules/nixos/flatpak.nix
      ../../modules/nixos/fonts.nix
      ../../modules/nixos/hardware.nix
      ../../modules/nixos/hyprland.nix
      ../../modules/nixos/locale.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/portals.nix
      ../../modules/nixos/ratbag.nix
      ../../modules/nixos/shell.nix
      ../../modules/nixos/sound.nix
      ../../modules/nixos/steam.nix
      ../../modules/nixos/touchpad.nix
      ../../modules/nixos/tty.nix
      ../../modules/nixos/users.nix

      inputs.home-manager.nixosModules.default
    ];

  networking-module.hostname = "nixos-laptop";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      "meywo" = import ./home.nix;
    };
  };

  system.stateVersion = "24.05";
}
