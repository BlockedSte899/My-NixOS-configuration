{ ... }:

{
  # Fish shell
  programs.fish.enable = true;

  # Starship fish theme
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };
    };
  };
}