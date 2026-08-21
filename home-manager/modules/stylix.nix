{ pkgs, ... }:

{
  stylix = {
    enable = true;

    polarity = "dark"; # Dark theme by default
    #opacity.terminal = 0.84; # I dont't use it bc it's declared in niri/config.kdl

    base16Scheme = {
      scheme = "Custom Dark (generated)";
      author = "generated from user JSON";
      base00 = "1F1F28"; # mSurface
      base01 = "2A2A37"; # mSurfaceVariant
      base02 = "363646"; # terminal.selectionBg / mHover
      base03 = "435965"; # mOutline
      base04 = "C8C093"; # mOnSurfaceVariant / terminal.normal.white
      base05 = "DCD7BA"; # mOnSurface / terminal.foreground
      base06 = "D5CD9D"; # terminal.bright.white
      base07 = "DCD7BA"; # (no distinct lightest bg in source; reuses base05)
      base08 = "C4746E"; # terminal.normal.red / mError
      base09 = "D4C196"; # terminal.bright.yellow (orange substitute)
      base0A = "C4B28A"; # terminal.normal.yellow / mPrimary
      base0B = "699469"; # terminal.normal.green
      base0C = "8EA49E"; # terminal.normal.cyan / mSecondary
      base0D = "435965"; # terminal.normal.blue / mOutline
      base0E = "938AA9"; # mTertiary
      base0F = "393836"; # terminal.normal.black
    };

    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
      size = 24; # Adjust the size to fit your screen
    };

    targets = {
      noctalia-shell.enable = false;
      zen-browser.enable = false;
    };
  };
}
