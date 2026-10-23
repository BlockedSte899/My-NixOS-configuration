{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    corefonts
    nerd-fonts.jetbrains-mono
    monocraft
  ];
}
