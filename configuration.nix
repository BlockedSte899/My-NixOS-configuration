# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # SDDM login manager
  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    extraPackages = [ pkgs.sddm-astronaut ];
  };
  services.xserver.enable = true;

  # Niri wayland compositor
  programs.niri.enable = true;

  # Fish shell
  programs.fish = {
    enable = true;

    shellAliases = {
      nixrebuild = "cd ~/nixos && sudo nixos-rebuild switch --flake .";
      nixupdate = "cd ~/nixos && sudo nix flake update && sudo nixos-rebuild switch --flake .";
    };

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alacritty
    git
    pulseaudio
    mpvpaper
    xwayland-satellite
    playerctl
    brightnessctl

    fastfetch
    cmatrix
    btop
    ffmpeg
    pkgs.thunar
    xarchiver
    lxqt.lxqt-policykit
    mpv
    gowall
    yazi
    img

    telegram-desktop
    firefox
    vscodium
    mousepad
    opencode
    obsidian
    pavucontrol
    bottles
    prismlauncher
    localsend
    gimp
    jetbrains.idea-oss
    obs-studio
    qbittorrent
    cinny-desktop
    immich

    #sddm-astronaut
    #(pkgs.sddm-astronaut.override { embeddedTheme = "hyprland_kath"; })
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "astronaut";
      themeConfig = {
        Background = "${./Wallpapers/kanagawa-paper/brown_city_planet.png}";
        Font = "monocraft";
        FullBlur = true;
        HideVirtualKeyboard = true;
      };
    })
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    monocraft
  ];

  # Stylix color scheme
  stylix.enable = true;
  stylix.homeManagerIntegration.autoImport = true;
  stylix.base16Scheme = {
    scheme = "Custom Dark (generated)";
    author = "generated from user JSON";
    base00 = "1F1F28"; # mSurface
    base01 = "2A2A37"; # mSurfaceVariant
    base02 = "363646"; # terminal.selectionBg / mHover
    base03 = "435965"; # mOutline
    base04 = "C8C093"; # mOnSurfaceVariant / terminal.normal.white
    base05 = "DCD7BA"; # mOnSurface / terminal.foreground
    base06 = "D5CD9D"; # terminal.bright.white
    base07 = "DCD7BA"; # (no distinct lightest bg in source; reuses base05)
    base08 = "C4746E"; # terminal.normal.red / mError
    base09 = "D4C196"; # terminal.bright.yellow (orange substitute)
    base0A = "C4B28A"; # terminal.normal.yellow / mPrimary
    base0B = "699469"; # terminal.normal.green
    base0C = "8EA49E"; # terminal.normal.cyan / mSecondary
    base0D = "435965"; # terminal.normal.blue / mOutline
    base0E = "938AA9"; # mTertiary
    base0F = "393836"; # terminal.normal.black
  };

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
      file = ./secrets/github-token.age;
      mode = "0400";
    };
  };

  # Secrets
  nix.extraOptions = '' !include ${config.age.secrets.github-token.path} '';

  # List services that you want to enable:

  # Immich
  services.immich = {
    enable = true;
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
  # networking.firewall.enable = false;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
