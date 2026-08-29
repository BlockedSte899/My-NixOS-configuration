{ config, pkgs, inputs, vars, ... }:

{

  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";
  home.stateVersion = vars.stateVersion;

  imports = [
    ./modules/bundle.nix
    ./stable-packages.nix
    ./unstable-packages.nix
  ];

}
