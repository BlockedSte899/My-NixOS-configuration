{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    xarchiver
    fzf
    unrar
    #lxqt.lxqt-policykit
    mpv
    mpc
    gowall

    imagemagick
    tesseract

    gimp
    lmstudio
    #cherry-studio
    (callPackage ./modules/cherry-studio.nix {})
    codex
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
    #telegram-desktop
    ayugram-desktop
    # qdirstat
    gparted
    mindustry
  ];
}

