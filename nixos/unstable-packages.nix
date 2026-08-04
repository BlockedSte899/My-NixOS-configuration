{ pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    telegram-desktop
    firefox
    immich
  ];
}
