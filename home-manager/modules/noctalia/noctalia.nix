{ inputs, vars, ... }:

{
imports = [ inputs.noctalia.homeModules.default ];

programs.noctalia = {
  enable = true;
  settings = ./noctalia.toml;
#  settings = {
#    bar.default = {
#      start = [ "launcher" "workspaces" "volume" "battery" "tray" ];
#      center = [ "cpu" "ram" "network_rx" ];
#      end = [ "notifications" "brightness" "clock" "session" ];
#    }; 
#    wallpaper = {
#      directory = "${vars.configPath}/Wallpapers";
#      default.path = "${vars.configPath}/Wallpapers/kanagawa-paper/brown_city_planet.png";
#      last.path = "/home/nikita/nixos-config/Wallpapers/kanagawa-paper/brown_city_planet.png";
#      monitors."eDP-1".path = "${vars.configPath}/Wallpapers/kanagawa-paper/brown_city_planet.png";
#   };
  };
}
