{ pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  systemd.services.NetworkManager-wait-online.enable = false;
  boot.kernelParams = [
    "quiet"
    "udev.log_level=3"
  ];

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Automatic store deduplication
  nix.settings.auto-optimise-store = true;
}
