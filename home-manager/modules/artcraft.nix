{ inputs, ... }:

{
  imports = [
    inputs.nix-craftapps.homeManagerModules.default
  ];

  programs.craftapps = {
    enable = true;
    apps = {
      photocraft.enable = true;
      vectorcraft.enable = true;
      effectcraft.enable = true;
      pdfcraft.enable = true;
      filmcraft.enable = true;
    };
  };
}

