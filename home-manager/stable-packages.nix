{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ffmpeg
    pkgs.thunar
    xarchiver
    unrar
    lxqt.lxqt-policykit
    mpv
    gowall

    gimp
    opencode
    lmstudio
    jetbrains.idea
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

