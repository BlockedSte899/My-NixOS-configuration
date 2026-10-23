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
      url = "github:noctalia-dev/noctalia/cachix";
      #url = "github:noctalia-dev/noctalia";
      #inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xmcl = {
      url = "github:x45iq/xmcl-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ytm-player = {
      url = "github:peternaame-boop/ytm-player";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    mc-server-manager = {
      url = "github:BlockedSte899/mc-server-manager";
    };

    nix-craftapps = {
      url = "github:olafkfreund/nix-craftapps";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixpkgs-unstable, ... } @ inputs:
  let
  vars = {
    username = "nikita";
    system = "x86_64-linux";
    hostname = "nixos";
    stateVersion = "26.05";
    configPath = "/home/${vars.username}/nixos-config";
  };

  pkgs = import nixpkgs {
    system = vars.system;
    config.allowUnfree = true;
    config.permittedInsecurePackages = [
      # required for opencode-desktop and cherry-studio
      "electron-41.9.1"
      "electron-40.10.5"
      "pnpm-10.29.2"
      "pnpm-10.34.0"
    ];
  };  

  pkgs-unstable = import nixpkgs-unstable {
    system = vars.system;
    config.allowUnfree = true;
    overlays = [ inputs.ytm-player.overlays.default ];
    config.permittedInsecurePackages = [
      "pnpm-10.34.0"
    ];
  };  

  in
  {
    nixosConfigurations.${vars.hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs vars pkgs-unstable; };

      modules = [
        {
          nixpkgs.pkgs = pkgs;
        }

        ./nixos/configuration.nix

        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup"; # required if opencode changes opencode.json
            extraSpecialArgs = { inherit inputs; inherit vars; inherit pkgs-unstable; };

            users.${vars.username} = ./home-manager/home.nix;

            sharedModules = [
              # inputs.zen-browser.homeModules.default
              inputs.stylix.homeModules.stylix
            ];
          };
        }

        inputs.agenix.nixosModules.default
        {
          environment.systemPackages = [ 
            inputs.agenix.packages.${vars.system}.default
            inputs.mc-server-manager.packages.${vars.system}.default
          ];
        }

      ];
    };
  };
}
