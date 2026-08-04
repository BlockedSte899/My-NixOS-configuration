{ pkgs, vars, ... }:

let
  sddm-astronaut-themed = pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
    themeConfig = {
      Background = "${../../Wallpapers/kanagawa-paper/brown_city_planet.png}";
      Font = "monocraft";
      FullBlur = true;
      HideVirtualKeyboard = true;
    };
  };
in
{
  environment.systemPackages = [
    sddm-astronaut-themed
    pkgs.qogir-icon-theme
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    wayland.compositor = "kwin";
    theme = "sddm-astronaut-theme";

    extraPackages = [
      sddm-astronaut-themed
      pkgs.kdePackages.qtmultimedia
      pkgs.kdePackages.qtsvg
    ];

    settings = {
      Theme = {
        CursorTheme = "Qogir";
        CursorSize = 24;
      };
    };
  };
}
