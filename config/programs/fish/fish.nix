{ inputs, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      n = {
        body = ''
          function n
            switch $argv[1]
              case rebuild
                sudo nixos-rebuild switch --flake ~/nixos
              case update
                sudo nix flake update --flake ~/nixos
                sudo nixos-rebuild switch --flake ~/nixos
              case clear
                sudo nix-collect-garbage -d
              case '*'
                echo "Unknown argument. Command list:"
                echo  " \033[1mn rebuild\033[1m - rebuilds system."
                echo  " \033[1mn update\033[1m - updates system."
                echo  " \033[1mn clear\033[1m - deletes system garbage."
              end
          end
        '';
      };
    };
  };
}