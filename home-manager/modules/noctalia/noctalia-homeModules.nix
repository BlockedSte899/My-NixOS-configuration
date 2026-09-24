{ inputs, vars, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
    settings = {
      bar.default = {
        start = [ "launcher" "workspaces" "volume" "brightness" "battery" ];
        center = [ "cpu" "ram" "network_rx" ];
        end = [ "tray" "widget_2" "notifications" "clock" "session" ];
        color = "secondary";
        icon_color = "primary";
        font_family = "Monocraft";
        thickness = 25;
        radius = 6;
        capsule_radius = 8;
        margin_ends = 68;
        margin_edge = 2;
        padding = 12;
        widget_spacing = 15;
        dead_zone.actions.left = "exec niri msg action toggle-overview";
      };
      control_center = {
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "wallpaper"; }
          { type = "caffeine"; }
          { type = "power_profile"; }
          { type = "session"; }
        ];
      };
      idle = {
        behavior_order = [ "screen-off" "lock" "lock-and-suspend" ]
        behavior = { 
          lock = {
            enabled = false;
            action = "lock";
            timeout = 600;
          };
          lock-and-suspend = {
            enabled = false;
            action = "lock_and_suspend";
            timeout = 900;
          };
          screen-off = {
            enabled = true;
            action = "screen_off";
            timeout = 1200;
          };
        };  
      };
      wallpaper = {
        directory = "${vars.configPath}/Wallpapers";
        default.path = "${vars.configPath}/Wallpapers/kanagawa-paper/brown_city_planet.png";
      };
    };
  };
}
