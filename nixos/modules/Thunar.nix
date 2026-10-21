{ pkgs, ... }:

{
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;
  security.polkit.enable = true;
  services.tumbler.enable = true;

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
  ];
}
