{ inputs, config, osConfig, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      n = {
        body = ''
            switch $argv[1]
              case rebuild
                git -C ~/nixos-config add .
                sudo nixos-rebuild switch --flake ~/nixos-config
              case update
                git -C ~/nixos add .
                sudo nix flake update --flake ~/nixos-config
                sudo nixos-rebuild switch --flake ~/nixos-config
              case clear
                sudo nix-collect-garbage -d
              case commit
                git -C ~/nixos-config add .
                set -l diff_output (git -C ~/nixos-config diff HEAD | string collect)
                if test -z "$diff_output"
                  echo "There is nothing to do."
                  return 0
                end
                set -l my_prompt "Make a very short (1 short sentence, up to 30 symbols) review of changes in repository for commit message. Here is the list of changes: :\n\n$diff_output"
                set -l api_key (sudo cat ${osConfig.age.secrets."gemini-api-key".path} | string trim)
                set -l response (jq -n --arg text "$my_prompt" '{contents: [{parts: [{text: $text}]}]}' | \
                  curl -s -X POST "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.1-flash-lite:generateContent?key=$api_key" \
                  -H "Content-Type: application/json" \
                  -d @- | jq -r '.candidates[0].content.parts[0].text')
                git -C ~/nixos-config commit -m "$response"
                git -C ~/nixos-config push -u origin main
                echo "Succesfully committed with message \"$response\""
              case '*'
                echo "Unknown argument. Command list:"
                echo  " \033[1mn rebuild\033[1m - rebuilds system."
                echo  " \033[1mn update\033[1m - updates system."
                echo  " \033[1mn clear\033[1m - deletes system garbage."
            end
        '';
      };
    };
  };
}
