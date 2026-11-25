# Noctalia settings, mirrored from the GUI by the dmopp/settings-to-nix plugin
# (/home/nikita/.local/state/noctalia/settings.toml). Every export overwrites this file.
#
# This file is your backup: keep it somewhere safe, for example in git.
#
# To restore, run this as your user in the directory of this file:
#   $(nix-build --no-out-link ./noctalia.nix)/bin/noctalia-restore-settings
# It replaces settings.toml (the old one is kept as settings.toml.bak-<time>).
# Then restart Noctalia; it installs the plugins listed here again on startup.
{ pkgs ? import <nixpkgs> { } }:
let
  settings = {
    bar.default = {
      end = [ "tray" "widget_2" "notifications" "clock" "session" ];
      start = [ "launcher" "workspaces" "volume" "brightness" "battery" ];
    };
    config_version = 20;
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
    plugin_settings = {
      "aabidk20/yt-music" = {
        mini_open_near_click = true;
        mini_placement = "attached";
      };
      "dmopp/settings-to-nix".target_path = "/home/nikita/nixos-config/home-manager/modules/noctalia.nix";
    };
    plugins.enabled = [
      "radimous/prismlauncher-instances"
      "aabidk20/yt-music"
      "noctalia/bitwarden"
      "noctalia/timer"
      "nightwatch75/file-search"
      "dmopp/settings-to-nix"
    ];
    shell = {
      clipboard_enabled = true;
      launcher.categories = false;
      polkit_agent = true;
      screenshot = {
        confirm_region = true;
        region_modifier = "super";
        remember_last_region = true;
      };
      settings_show_advanced = false;
    };
    theme = {
      builtin = "Eldritch";
      community_palette = "Kanagawa Paper";
      mode = "dark";
      source = "community";
      wallpaper_scheme = "m3-content";
    };
    widget = {
      brightness.show_label = false;
      clock.actions.right = "panel-toggle noctalia/timer:panel";
      widget = {
        scale = 1.1500000000000001;
        type = "aabidk20/yt-music:widget";
      };
      widget_2 = {
        scale = 1.25;
        type = "aabidk20/yt-music:widget";
      };
    };
  };
  settingsToml = (pkgs.formats.toml { }).generate "noctalia-settings.toml" settings;
in
(pkgs.writeShellScriptBin "noctalia-restore-settings" ''
  set -eu
  PATH=${pkgs.coreutils}/bin:$PATH
  if [ -n "''${NOCTALIA_STATE_HOME:-}" ]; then
    dir="$NOCTALIA_STATE_HOME/noctalia"
  elif [ -n "''${XDG_STATE_HOME:-}" ]; then
    dir="$XDG_STATE_HOME/noctalia"
  else
    dir="$HOME/.local/state/noctalia"
  fi
  mkdir -p "$dir"
  if [ -e "$dir/settings.toml" ]; then
    backup="$dir/settings.toml.bak-$(date +%Y%m%d-%H%M%S)"
    cp "$dir/settings.toml" "$backup"
    echo "Previous settings saved to $backup"
  fi
  tmp=$(mktemp "$dir/.settings.toml.XXXXXX")
  cat ${settingsToml} > "$tmp"
  chmod 644 "$tmp"
  mv "$tmp" "$dir/settings.toml"
  # Skip the first-run wizard; it would write its own choices over the restored ones.
  touch "$dir/.setup-complete"
  echo "Noctalia settings restored to $dir/settings.toml."
  echo "Restart Noctalia so it installs the plugins from the restored settings."
'') // { inherit settings; }
