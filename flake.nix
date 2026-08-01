{
  description = "A very basic flake";

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { nixpkgs, ... } @ inputs:
  let
  vars = {
    username = "nikita";
    system = "x86_64-linux";
    hostname = "nixos";
    stateVersion = "26.05";
    configPath = "/home/${vars.username}/nixos-config";
  };
  in
  {
    nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; inherit vars; };

      modules = [
        ./configuration.nix

        inputs.home-manager.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${vars.username} = ./home-manager/home.nix;
          home-manager.extraSpecialArgs = { inherit inputs; inherit vars; };

          home-manager.sharedModules = [
          #  inputs.zen-browser.homeModules.default
          ];
        }

        inputs.stylix.nixosModules.stylix

        inputs.agenix.nixosModules.default
        {
          environment.systemPackages = [ inputs.agenix.packages.${vars.system}.default ];
        }

      ];
    };
 
  };
}
