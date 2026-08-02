{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    telegram-desktop
    firefox
    obsidian
    bottles
    prismlauncher
    localsend
    obs-studio
    qbittorrent
    immich
  ];
}
