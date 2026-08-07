{ ... }:

{
  # Required for better controllers (dualshock 4) support
  programs.steam = {
    enable = true;
    protontricks.enable = true;
  };
}