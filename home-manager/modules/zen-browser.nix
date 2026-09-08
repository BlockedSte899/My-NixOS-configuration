{ inputs, config, ... }:

let

  # Converts base-16 to base-10
  toInt = x: { "0"=0;"1"=1;"2"=2;"3"=3;"4"=4;"5"=5;"6"=6;"7"=7;"8"=8;"9"=9;a=10;A=10;b=11;B=11;c=12;C=12;d=13;D=13;e=14;E=14;f=15;F=15; }.${x};

  # Converts hex color to RGB
  toRed = hex: (toInt (builtins.substring 0 1 hex)) * 16 + (toInt (builtins.substring 1 1 hex));
  toGreen = hex: (toInt (builtins.substring 2 1 hex)) * 16 + (toInt (builtins.substring 3 1 hex));
  toBlue = hex: (toInt (builtins.substring 4 1 hex)) * 16 + (toInt (builtins.substring 5 1 hex));

in
{
imports = [ inputs.zen-browser.homeModules.default ];

programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles.default = {
      settings = {
        # dark UI
        "zen.view.window.scheme" = 0;
        # dark web content
        "layout.css.prefers-color-scheme.content-override" = 0;
      };

      mods = [
        "c6813222-6571-4ba6-8faf-58f3343324f6" # Disable Rounded Corners
        "b51ff956-6aea-47ab-80c7-d6c047c0d510" # Disable Status Bar
        #"642854b5-88b4-4c40-b256-e035532109df" # Transparent Zen
      ];


    };
  };
}
