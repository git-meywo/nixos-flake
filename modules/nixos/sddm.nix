{ config, lib, pkgs, ... }:

{
  options = {
    sddm-module.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = false;
      description = "Whether to enable SDDM.";
    };
  };

  config = lib.mkIf config.sddm-module.enable {
    services = {
      displayManager.sddm = {
        enable = true;
	theme = "${
	  (
	    pkgs.fetchFromGitHub {
	      owner = "Keyitdev";
	      repo = "sddm-astronaut-theme";
	      rev = "07e7105aec5dd0b10631fc1f9ab2e84a6dedad51";
	      sha256 = "0hlb2lhyi876y8a3rkfmr8l82lhzyknn0yxihfd2zzrkz9f64ban";
            }
	  )
	}";
	extraPackages = [
	  pkgs.libsForQt5.qt5.qtsvg
	];
      };
      xserver = {
        enable = true;
        xkb = {
          layout = "fr";
          variant = "azerty";
        };
      };
    };
  };
}
