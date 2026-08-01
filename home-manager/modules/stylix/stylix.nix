{
  stylix = {
    opacity.terminal = 0.95;
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