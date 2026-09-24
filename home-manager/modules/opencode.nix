{ pkgs-unstable, ... }:

{
  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      "$schema" = "https://opencode.ai/config.json";

      plugin = [];
    };
  };
}
        
