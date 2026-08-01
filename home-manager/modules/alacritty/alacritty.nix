{ inputs, pkgs, ... }:

{
programs.alacritty = {
    enable = true;
    settings = {
      terminal.shell = {
        program = "${pkgs.fish}/bin/fish";
        args = [ "--login" ];
      };

      keyboard.bindings = [
        {
          key = 46; # Scancode for "C"
          mods = "Control|Shift";
          action = "Copy";
        }
        {
          key = 55; # Scancode for "V"
          mods = "Control|Shift";
          action = "Paste";
        }
      ];
    };
  };

}