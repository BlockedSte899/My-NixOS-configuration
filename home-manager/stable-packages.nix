{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    yt-dlp
    ytmdesktop
    pkgs.thunar
    xarchiver
    unrar
    lxqt.lxqt-policykit
    mpv
    mpc
    gowall

    gimp
    opencode
    opencode-desktop
    lmstudio
    onlyoffice-desktopeditors
    bottles
    obsidian
    obs-studio
    localsend
    qbittorrent
    ferdium
    kdePackages.okular
    kdePackages.kate
    # qdirstat
  ];
}

