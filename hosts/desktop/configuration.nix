{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/nixos/boot.nix
      ../../modules/nixos/fonts.nix
      ../../modules/nixos/hardware.nix
      ../../modules/nixos/hyprland.nix
      ../../modules/nixos/locale.nix
      ../../modules/nixos/networking.nix
      ../../modules/nixos/nvidia.nix
      ../../modules/nixos/packages.nix
      ../../modules/nixos/portals.nix
      ../../modules/nixos/sddm.nix
      ../../modules/nixos/shell.nix
      ../../modules/nixos/sound.nix
      ../../modules/nixos/tty.nix
      ../../modules/nixos/users.nix

      inputs.home-manager.nixosModules.default

      {
        nixpkgs.overlays = [ inputs.hyprpanel.overlay ];
        _module.args = { inherit inputs; };
      }
    ];

  networking-module.hostname = "nixos-pc";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
