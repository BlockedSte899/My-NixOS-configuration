{ pkgs, ... }:


{
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
    yazi
    viu
    vim
  ];
}

