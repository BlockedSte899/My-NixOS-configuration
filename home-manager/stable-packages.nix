{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    pkgs.thunar
    xarchiver
    unrar
    #lxqt.lxqt-policykit
    mpv
    mpc
    gowall

    gimp
    lmstudio
    #cherry-studio
    (callPackage ./modules/cherry-studio.nix {})
    whisper-cpp
    onlyoffice-desktopeditors
    bottles
    obsidian
    audacity
    localsend
    qbittorrent
    ferdium
    teams-for-linux
    google-chrome
    kdePackages.okular
    kdePackages.kate
    telegram-desktop
    ayugram-desktop
    # qdirstat
    gparted
  ];
}

