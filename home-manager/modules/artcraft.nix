{ inputs, ... }:

{
  imports = [
    inputs.nix-craftapps.homeManagerModules.default
  ];

  programs.craftapps = {
    enable = true;
    apps = {
      photocraft.enable = true;
      pdfcraft.enable = true;
      filmcraft.enable = true;
    };
  };
}

