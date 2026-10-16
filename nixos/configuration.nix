{ config, pkgs, vars, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./stable-packages.nix
      ./unstable-packages.nix
    ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Cachix binary cache 
  nix.settings = {
    extra-substituters = [
      "https://noctalia.cachix.org"
      "https://mc-server-manager.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "mc-server-manager.cachix.org-1:Hsl2QiUTpR2soBiVT3OMX+whjLoGkMooh05O0dGMbiI="
    ];
  };

  # Never change this value!
  system.stateVersion = "26.05";

}
