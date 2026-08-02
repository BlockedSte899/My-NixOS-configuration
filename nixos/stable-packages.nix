{ pkgs, ... }:


{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alacritty
    git
    jq
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
    vim

    opencode
    mousepad
    gimp
    jetbrains.idea
    # qdirstat
  ];
}

