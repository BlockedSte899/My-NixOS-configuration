{ config, pkgs, inputs, ... }: {

home.username = "nikita";
home.homeDirectory = "/home/nikita";
home.stateVersion = "25.05";

xdg.configFile."niri/config.kdl".source = ./config/programs/niri/config.kdl;   # niri

xdg.configFile."Thunar/accels.scm".source = ./config/programs/Thunar/accels.scm;   # Thunar
xdg.configFile."Thunar/uca.xml".source = ./config/programs/Thunar/uca.xml;   # Thunar

imports = [
  ./config/programs/noctalia/noctalia.nix
  ./config/programs/alacritty/alacritty.nix
  ./config/programs/zen-browser/zen-browser.nix
  ./config/programs/fish/fish.nix
  ./config/programs/mpv/mpv.nix
  ./config/programs/vim/vim.nix
];

gtk = {
  enable = true;
  iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus";
  };
};

stylix = {
  opacity.terminal = 0.95;
  cursor = {
    package = pkgs.qogir-icon-theme;
    name = "Qogir";
    size = 24; # Adjust the size to fit your screen
  };
  targets = {
    noctalia-shell.enable = false;
    zen-browser.enable = false;
  };
};

}
