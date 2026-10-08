{ pkgs, ... }:

{
  boot = {
    loader ={
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      timeout = null;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        theme = "${pkgs.minimal-grub-theme}";
        splashImage = null;
      };
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelPackages = pkgs.linuxPackages;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
    ];      
  }; 
  systemd.services = {
    NetworkManager-wait-online.enable = false;
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  # Automatic store deduplication
  nix.settings.auto-optimise-store = true;
}
