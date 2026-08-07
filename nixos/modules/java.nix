{ pkgs, ... }:

{
  programs.java = {
    enable = true;
    # Installs the Temurin JRE binary (runtime only, no compiler)
    package = pkgs.temurin-jre-bin; 
  };
}