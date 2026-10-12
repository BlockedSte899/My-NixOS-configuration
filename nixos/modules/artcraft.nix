{ inputs, ... }:

{
  imports = [
    inputs.artcraft.nixosModules.default
  ];

  programs.artcraft.enable = true;
}
