{ pkgs, ... }:

{
  users.users."nikita" = {
    isNormalUser = true;
    description = "Nikita";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };
}
