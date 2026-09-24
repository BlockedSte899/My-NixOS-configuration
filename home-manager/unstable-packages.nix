{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    telegram-desktop
    firefox
    ytm-player
    yt-dlp
    #cherry-studio
  ];
}
