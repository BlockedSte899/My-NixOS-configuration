{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    telegram-desktop
    firefox
    obsidian
    prismlauncher
    localsend
    obs-studio
    qbittorrent
    immich
  ];
}
