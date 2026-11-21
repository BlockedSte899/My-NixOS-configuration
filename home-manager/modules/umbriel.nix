{ inputs, config, ... }:

{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      #include.files = [ "${inputs.umbriel}/examples/config.toml" ];
      general = {
        autostart = [ "noctalia" ];
        show_cheatsheet = false;
      };
      output = {
        "DP-1" = {
          mode = "1920x1080@75";
          position = [ 0 0 ];
          focus_at_startup = true;
        };
        "eDP-1" = {
          mode = "1920x1080@144";
          position = [ 1920 0 ];
          #scale = 1.2;
        };
      };
      layout = {
        gap = 6;
        scrolling = {
          center_focused = "always";
        };
      };
      input = {
        keyboard = {
          layout = "us,ru,ge";
          options = "grp:caps_toggle";
        };
        focus = {
          follows_mouse = "sloppy";
        };
        touchpad = {
          natural_scroll = true;
        };
      };
      appearance = {
        border_width = 4;
        corner_radius = 0;
      };
      colors = {
        background = "#${config.lib.stylix.colors.base00}";
        border = {
          focused = "#${config.lib.stylix.colors.base09}"; 
          unfocused = "#${config.lib.stylix.colors.base00}";
        };
      }; 
      keybinds = {
        # Applications and session
        "Mod+Escape" = "session-quit";
        "Mod+Space" = "spawn noctalia msg panel-toggle launcher";
        "Mod+C" = "spawn noctalia msg panel-toggle clipboard";
        "Print" = "spawn noctalia msg screenshot-region";
        "Mod+O" = { action = "overview-toggle"; repeat = false; };
        "Mod+Q" = { action = "window-close"; repeat = false; };
        "Mod+A" = { action = "spawn kitty"; repeat = false; };
        "Mod+S" = { action = "spawn zen-beta"; repeat = false; };
        "Mod+E" = { action = "spawn thunar"; repeat = false; };
        
        # Media, volume and brightness
        "XF86AudioRaiseVolume" = { action = "spawn noctalia msg volume-up"; allow_when_locked = true; };
        "XF86AudioLowerVolume" = { action = "spawn noctalia msg volume-down"; allow_when_locked = true; };
        "XF86AudioMute" = { action = "spawn noctalia msg volume-mute"; allow_when_locked = true; repeat = false; };
        "XF86AudioPlay" = { action = "spawn noctalia msg media toggle"; allow_when_locked = true; repeat = false; };
        "XF86AudioNext" = { action = "spawn noctalia msg media next"; allow_when_locked = true; };
        "XF86AudioPrev" = { action = "spawn noctalia msg media previous"; allow_when_locked = true; };
        "XF86MonBrightnessUp" = { action = "spawn noctalia msg brightness-up"; allow_when_locked = true; };
        "XF86MonBrightnessDown" = { action = "spawn noctalia msg brightness-down"; allow_when_locked = true; };
        
        # Focus and movement
        "Mod+Left" = "window-focus-left";
        "Mod+Right" = "window-focus-right";
        "Mod+Up" = "window-focus-up";
        "Mod+Down" = "window-focus-down";
        "Mod+H" = "window-focus-left";
        "Mod+J" = "window-focus-down";
        "Mod+K" = "window-focus-up";
        "Mod+L" = "window-focus-right";
        "Mod+MouseBack" = "window-focus-left";
        "Mod+MouseForward" = "window-focus-right";
        "Mod+Ctrl+Left" = "column-move-left";
        "Mod+Ctrl+Down" = "window-move-down";
        "Mod+Ctrl+Up" = "window-move-up";
        "Mod+Ctrl+Right" = "column-move-right";
        "Mod+Ctrl+H" = "column-move-left";
        "Mod+Ctrl+J" = "window-move-down";
        "Mod+Ctrl+K" = "window-move-up";
        "Mod+Ctrl+L" = "column-move-right";
        "Mod+Ctrl+MouseBack" = "column-move-left";
        "Mod+Ctrl+MouseForward" = "column-move-right";
        "Mod+BracketLeft" = "window-move-left";
        "Mod+BracketRight" = "window-move-right";
        "Mod+F1" = "window-focus-next";

        # Window state and layout
        "Mod+V" = { action = "window-toggle-floating"; repeat = false; };
        "Mod+F" = { action = "window-toggle-fullscreen"; repeat = false; };
        "Mod+Ctrl+F" = { action = "window-toggle-maximize"; repeat = false; };
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+Minus" = "window-modify-primary-extent -0.1";
        "Mod+Equal" = "window-modify-primary-extent +0.1";
        "Mod+Ctrl+Minus" = "window-modify-secondary-extent -0.02";
        "Mod+Ctrl+Equal" = "window-modify-secondary-extent +0.02";

        # Workspaces
        "Mod+1" = "workspace-switch 1";
        "Mod+2" = "workspace-switch 2";
        "Mod+3" = "workspace-switch 3";
        "Mod+4" = "workspace-switch 4";
        "Mod+5" = "workspace-switch 5";
        "Mod+6" = "workspace-switch 6";
        "Mod+7" = "workspace-switch 7";
        "Mod+8" = "workspace-switch 8";
        "Mod+9" = "workspace-switch 9";
        "Mod+U" = "workspace-previous";
        "Mod+I" = "workspace-next";
        "Mod+Page_Up" = "workspace-previous";
        "Mod+Page_Down" = "workspace-next";
        "Mod+WheelUp" = { action = "workspace-previous"; cooldown_ms = 150; };
        "Mod+WheelDown" = { action = "workspace-next"; cooldown_ms = 150; };
        "Mod+Ctrl+1" = "window-move-to-workspace 1";
        "Mod+Ctrl+2" = "window-move-to-workspace 2";
        "Mod+Ctrl+3" = "window-move-to-workspace 3";
        "Mod+Ctrl+4" = "window-move-to-workspace 4";
        "Mod+Ctrl+5" = "window-move-to-workspace 5";
        "Mod+Ctrl+6" = "window-move-to-workspace 6";
        "Mod+Ctrl+7" = "window-move-to-workspace 7";
        "Mod+Ctrl+8" = "window-move-to-workspace 8";
        "Mod+Ctrl+9" = "window-move-to-workspace 9";
        "Mod+Ctrl+U" = "window-move-to-workspace-previous";
        "Mod+Ctrl+I" = "window-move-to-workspace-next";
        "Mod+Ctrl+Page_Up" = "workspace-previous";
        "Mod+Ctrl+Page_Down" = "workspace-next";
        "Mod+Ctrl+WheelUp" = { action = "window-move-to-workspace-previous"; cooldown_ms = 150; };
        "Mod+Ctrl+WheelDown" = { action = "window-move-to-workspace-next"; cooldown_ms = 150; };   
        
        # Scratchpad
        "Mod+X" = "scratchpad-toggle";
        "Mod+Shift+X" = { action = "window-move-to-scratchpad"; repeat = false; };
        "Mod+Ctrl+X" = { action = "window-restore-from-scratchpad"; repeat = false; };
        "Mod+Tab" = "scratchpad-focus-next";

        # Layout switcher
        "Mod+Alt+1" = "workspace-set-layout scrolling";
        "Mod+Alt+2" = "workspace-set-layout stacking";
        "Mod+Alt+3" = "workspace-set-layout master";
        "Mod+Alt+4" = "workspace-set-layout dwindle";
      };   
    };
  }; 
}
