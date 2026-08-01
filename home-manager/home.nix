{ config, pkgs, inputs, vars, ... }: {

home.username = vars.username;
home.homeDirectory = "/home/${vars.username}";
home.stateVersion = vars.stateVersion;

xdg.configFile."niri/config.kdl".source = ./modules/niri/config.kdl;   # niri

xdg.configFile."Thunar/accels.scm".source = ./modules/Thunar/accels.scm;   # Thunar
xdg.configFile."Thunar/uca.xml".source = ./modules/Thunar/uca.xml;   # Thunar

imports = [
  ./modules/bundle.nix
];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
  };

}
