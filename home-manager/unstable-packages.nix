{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    firefox
    yt-dlp
  ];
}
