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
    cherry-studio
    onlyoffice-desktopeditors
    bottles
    obsidian
    audacity
    localsend
    qbittorrent
    ferdium
    teams-for-linux
    kdePackages.okular
    kdePackages.kate
    # qdirstat
  ];
}

