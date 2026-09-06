{ inputs, vars, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {
      bar.default = {
        start = [ "launcher" "workspaces" "volume" "battery" "tray" ];
        center = [ "cpu" "ram" "network_rx" ];
        end = [ "notifications" "brightness" "clock" "session" ];
        font_family = "Monocraft";
        thickness = 25;
        margin_ends = 68;
        margin_edge = 2;
        padding = 12;
        widget_spacing = 15;
        dead_zone.actions.left = "exec niri msg action toggle-overview";
      };
      wallpaper = {
        directory = "${vars.configPath}/Wallpapers";
        default.path = "${vars.configPath}/Wallpapers/kanagawa-paper/brown_city_planet.png";
      };
    };
  };
}
