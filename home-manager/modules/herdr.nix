{ pkgs-unstable, ... }:

{
  programs.herdr = {
    package = pkgs-unstable.herdr;
    enable = true;
  };
}
