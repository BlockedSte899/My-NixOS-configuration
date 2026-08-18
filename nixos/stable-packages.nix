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
    neovim

    opencode
    mousepad
    gimp
    jetbrains.idea
    bottles
    obsidian
    obs-studio
    localsend
    qbittorrent
    youtube-tui
    # qdirstat
  ];
}

