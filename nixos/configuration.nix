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
      "https://umbriel.cachix.org"
      "https://mc-server-manager.cachix.org"
    ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
      "mc-server-manager.cachix.org-1:Hsl2QiUTpR2soBiVT3OMX+whjLoGkMooh05O0dGMbiI="
    ];
  };

  # Never change this value!
  system.stateVersion = "26.05";

}
