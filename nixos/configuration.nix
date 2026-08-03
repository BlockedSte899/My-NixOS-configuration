# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, vars, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/bundle.nix
      ./stable-packages.nix
      ./unstable-packages.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Niri wayland compositor
  programs.niri.enable = true;

  # Fish shell
  programs.fish = {
    enable = true;
    interactiveShellInit = '' set -g fish_greeting "" '';
  };

  # Starship fish theme
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tbilisi";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ka_GE.UTF-8";
    LC_IDENTIFICATION = "ka_GE.UTF-8";
    LC_MEASUREMENT = "ka_GE.UTF-8";
    LC_MONETARY = "ka_GE.UTF-8";
    LC_NAME = "ka_GE.UTF-8";
    LC_NUMERIC = "ka_GE.UTF-8";
    LC_PAPER = "ka_GE.UTF-8";
    LC_TELEPHONE = "ka_GE.UTF-8";
    LC_TIME = "ka_GE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."nikita" = {
    isNormalUser = true;
    description = "Nikita";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    monocraft
  ];

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Everything related to Thunar File manager
  programs.xfconf.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  security.polkit.enable = true;
  services.tumbler.enable = true;

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];

  # Agenix
  age.secrets = {
    github-token = {
      file = "${vars.configPath}/secrets/github-token.age";
      mode = "0400";
    };
    gemini-api-key = {
      file = "${vars.configPath}/secrets/gemini-api-key.age";
      mode = "0400";
    };
  };

  # Secrets
  nix.extraOptions = '' !include ${config.age.secrets.github-token.path} '';

  # List services that you want to enable:

  # Disable network check daemon on start
  systemd.services.NetworkManager-wait-online.enable = false;

  # Required for better controllers (dualshock 4) support
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };

  services.zerotierone = {
    enable = true;
    port = 9993;
    joinNetworks = [ "8850338390106a82" ];
  };

  # Immich
  services.immich = {
    enable = false;
    host = "0.0.0.0";
    port = 2283;
    openFirewall = true;
    mediaLocation = "/var/lib/immich";
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true; # enables the bluetooth hardware
    powerOnBoot = true; # powers on the adapter on boot
    settings = {
      General = {
        ControllerMode = "dual";
        Experimental = "true";
      };
    };
  };

  # Power services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # Nvidia proprietary drivers
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true; # important for wayland
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true; # gui interface for settings
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # Intel graphics driver
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      libva-vdpau-driver
      libvdpau-va-gl
      vpl-gpu-rt
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
