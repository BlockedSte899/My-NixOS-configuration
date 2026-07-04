{ config, pkgs, ... }: {

home.username = "nikita";
home.homeDirectory = "/home/nikita";
home.stateVersion = "25.05";

xdg.configFile."niri/config.kdl".source = ./config/programs/niri/config.kdl;   # niri
xdg.configFile."alacritty/alacritty.toml".source = ./config/programs/alacritty/alacritty.toml;   # niri
}