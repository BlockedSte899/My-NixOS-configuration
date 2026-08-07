{ pkgs, ... }:

{
  users.users."nikita" = {
    isNormalUser = true;
    description = "Nikita";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
}