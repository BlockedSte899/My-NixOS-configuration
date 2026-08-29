{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    telegram-desktop
    firefox
    immich
    youtube-tui
  ];
}
