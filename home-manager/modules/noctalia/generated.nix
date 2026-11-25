# blockedste899/nix-config-generator — AUTO-GENERATED from `noctalia config export merged`; do not edit.
# Credentials recognized by Noctalia are omitted. Manage excluded paths separately.
#
{
  bar.default = {
    capsule_group = [
      {
        border = "";
        enabled = true;
        fill = "surface";
        id = "g1";
        members = [ "cpu" "ram" "network_rx" ];
        opacity = 1.0;
        padding = 8.0;
        radius = 12.0;
      }
    ];
    capsule_radius = 8;
    capsule_thickness = 0.99999998137354851;
    center = [ "group:g1" ];
    color = "secondary";
    dead_zone.actions = {
      left = "exec niri msg action toogle-overview; umbriel msg overview-toggle";
      middle = "none";
    };
    end = [ "tray" "widget_2" "notifications" "clock" "session" ];
    font_family = "Monocraft";
    font_weight = 600;
    icon_color = "primary";
    margin_edge = 2;
    margin_ends = 68;
    padding = 12;
    panel_overlap = 0;
    radius = 6;
    start = [ "launcher" "workspaces" "volume" "brightness" "battery" ];
    thickness = 25;
    widget_spacing = 15;
  };
  battery.warning_threshold = 20;
  calendar.enabled = true;
  control_center = {
    calendar.show_events_card = true;
    shortcuts = [
      {
        type = "wifi";
      }
      {
        type = "bluetooth";
      }
      {
        type = "wallpaper";
      }
      {
        type = "caffeine";
      }
      {
        type = "power_profile";
      }
      {
        type = "session";
      }
    ];
    sidebar = "full";
    width = 750;
  };
  desktop_widgets = {
    enabled = false;
    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };
    schema_version = 2;
    widget = { };
    widget_order = [ ];
  };
  idle = {
    behavior = {
      lock = {
        action = "lock";
        enabled = false;
        timeout = 600.0;
      };
      lock-and-suspend = {
        action = "lock_and_suspend";
        enabled = false;
        timeout = 900.0;
      };
      screen-off = {
        action = "screen_off";
        enabled = true;
        timeout = 1200.0;
      };
    };
    behavior_order = [ "screen-off" "lock" "lock-and-suspend" ];
  };
  location.auto_locate = true;
  lockscreen_widgets = {
    enabled = true;
    grid = {
      cell_size = 16;
      major_interval = 4;
      visible = true;
    };
    schema_version = 2;
    widget = {
      "lockscreen-login-box@DP-1" = {
        box_height = 128.0;
        box_width = 720.0;
        cx = 960.0;
        cy = 860.0;
        output = "DP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        settings = {
          background_color = "surface_container";
          background_opacity = 0.88;
          background_radius = 12.0;
          center_password_text = false;
          input_opacity = 1.0;
          input_radius = 6.0;
          layout = "regular";
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_media = false;
          show_media_controls = true;
          show_password_reveal = true;
          show_session_buttons = true;
          show_unlock_hint = false;
          show_weather = false;
        };
        type = "login_box";
      };
      "lockscreen-login-box@eDP-1" = {
        box_height = 128.0;
        box_width = 720.0;
        cx = 960.0;
        cy = 860.0;
        output = "eDP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        settings = {
          background_color = "surface_container";
          background_opacity = 0.88;
          background_radius = 12.0;
          center_password_text = false;
          input_opacity = 1.0;
          input_radius = 6.0;
          layout = "regular";
          show_caps_lock = true;
          show_keyboard_layout = true;
          show_login_button = true;
          show_media = false;
          show_media_controls = true;
          show_password_reveal = true;
          show_session_buttons = true;
          show_unlock_hint = false;
          show_weather = false;
        };
        type = "login_box";
      };
      lockscreen-widget-0000000000000001 = {
        box_height = 224.0;
        box_width = 416.0;
        cx = 960.0;
        cy = 300.0;
        output = "eDP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        type = "clock";
      };
      lockscreen-widget-0000000000000003 = {
        box_height = 224.0;
        box_width = 416.0;
        cx = 960.0;
        cy = 300.0;
        output = "DP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        type = "clock";
      };
    };
    widget_order = [
      "lockscreen-login-box@DP-1"
      "lockscreen-login-box@eDP-1"
      "lockscreen-widget-0000000000000001"
      "lockscreen-widget-0000000000000003"
    ];
  };
  notification = {
    filter_order = [ "filter" ];
    layer = "overlay";
  };
  plugin_settings = {
    "aabidk20/yt-music" = {
      mini_open_near_click = true;
      mini_placement = "attached";
    };
    "avivbintangaringga/nix-monitor" = {
      branch = "nixos-26.05";
      clean_command = "nix-collect-garbage -d";
      update_command = "";
    };
    "blockedste899/nix-config-generator" = {
      exclude_paths = [
        "calendar.account"
        "plugin_settings.\"local/nix-config-generator\".target_path"
      ];
      target_path = "/home/nikita/nixos-config/home-manager/modules/noctalia/generated.nix";
    };
    "local/nix-config-generator".target_path = "/home/nikita/nixos-config/home-manager/modules/noctalia/generated.nix";
    "noctalia/mpvpaper".video_directory = "~/nixos/Wallpapers";
    "radimous/prismlauncher-instances".prism_path = "~/.local/share/PrismLauncher";
  };
  plugins = {
    enabled = [
      "radimous/prismlauncher-instances"
      "aabidk20/yt-music"
      "noctalia/bitwarden"
      "noctalia/timer"
      "nightwatch75/file-search"
      "alexander/screen-toolkit"
      "local/nix-config-generator"
      "blockedste899/nix-config-generator"
    ];
    source = [
      {
        kind = "git";
        name = "official";
      }
      {
        kind = "git";
        name = "community";
      }
      {
        kind = "git";
        name = "my-plugins";
      }
    ];
  };
  shell = {
    clipboard_enabled = true;
    font_family = "JetBrainsMono Nerd Font";
    keyboard_layout.custom_labels = {
      "English (US)" = "US";
      Georgian = "GE";
      Russian = "RU";
    };
    launcher = {
      app_grid = true;
      categories = false;
      pinned = [
        "zen-beta"
        "obsidian"
        "ferdium"
        "com.usebottles.bottles"
        "org.prismlauncher.PrismLauncher"
      ];
      providers = {
        calculator.prefix = "";
        emoji.global = true;
        session.global = false;
        wallpaper.global = true;
      };
    };
    panel.open_near_click_control_center = true;
    password_style = "random";
    polkit_agent = true;
    screen_time_enabled = true;
    screenshot = {
      confirm_region = true;
      directory = "~/Pictures/Screenshots";
      region_modifier = "super";
      remember_last_region = true;
    };
    settings_show_advanced = false;
  };
  system.monitor.disk_poll_seconds = 0;
  theme = {
    builtin = "Eldritch";
    community_palette = "Kanagawa Paper";
    mode = "dark";
    source = "community";
    templates = {
      builtin_ids = [ ];
      enable_community_templates = false;
    };
    wallpaper_scheme = "m3-content";
  };
  wallpaper = {
    default.path = "/home/nikita/nixos-config/Wallpapers/kanagawa-paper/brown_city_planet.png";
    directory = "~/nixos-config/Wallpapers";
    last.path = "/home/nikita/nixos-config/Wallpapers/kanagawa-paper/brown_city_planet.png";
    monitors = {
      DP-1.path = "/home/nikita/nixos-config/Wallpapers/kanagawa-paper/brown_city_planet.png";
      eDP-1.path = "/home/nikita/nixos-config/Wallpapers/kanagawa-paper/brown_city_planet.png";
    };
    transition = [ "disc" "fade" "honeycomb" "stripes" "wipe" "zoom" ];
    transition_on_startup = true;
  };
  widget = {
    battery = {
      color = "secondary";
      device = "/org/freedesktop/UPower/devices/battery_BAT0";
      display_mode = "graphic";
      hide_when_full = true;
      show_label = false;
    };
    brightness.show_label = false;
    clock = {
      actions.right = "panel-toggle noctalia/timer:panel";
      color = "secondary";
      tooltip_format = "{:%a, %d/%m/%Y %H:%M:%S}";
    };
    cpu = {
      display = "text";
      visualization = "none";
    };
    launcher = {
      capsule_radius = "auto";
      icon_color = "primary";
      scale = 1.2;
    };
    network = {
      enabled = true;
      show_label = false;
    };
    network_rx = {
      display = "text";
      network_speed_compact = true;
      network_speed_unit = "mb";
      show_label = false;
      visualization = "none";
    };
    ram = {
      display = "text";
      visualization = "none";
    };
    sysmon.stat = "ram_pct";
    widget = {
      scale = 1.1500000000000001;
      type = "aabidk20/yt-music:widget";
    };
    widget_2 = {
      scale = 1.25;
      type = "aabidk20/yt-music:widget";
    };
  };
}
