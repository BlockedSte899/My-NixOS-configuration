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

  # Never change this value!
  system.stateVersion = "26.05";

}
