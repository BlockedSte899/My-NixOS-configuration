{ pkgs, ... }:


{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    git
    lazygit
    jq
    pulseaudio
    mpvpaper
    xwayland-satellite
    playerctl
    brightnessctl

    fastfetch
    cmatrix
    btop
    nvtopPackages.full
    bat
    lsd
    fd
    ffmpeg
    pkgs.thunar
    xarchiver
    unrar
    lxqt.lxqt-policykit
    mpv
    gowall
    yazi
    viu
    vim

    opencode
    gimp
    jetbrains.idea
    bottles
    obsidian
    obs-studio
    localsend
    qbittorrent
    youtube-tui
    ferdium
    kdePackages.okular
    kdePackages.kate
    # qdirstat
  ];
}

