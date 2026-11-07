{ inputs, ... }:

{
  imports = [ inputs.umbriel.homeModules.default ];

  programs.umbriel = {
    enable = true;
    settings = {
      general.autostart = [ "noctalia" ];
    };
  }; 
}
