{ inputs, config, osConfig, vars, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = '' set -g fish_greeting "" '';
    functions = {
      n = {
        body = ''
            switch $argv[1]
              case rebuild
                git -C ${vars.configPath} add .
                sudo nixos-rebuild switch --flake ${vars.configPath}
              case update
                git -C ${vars.configPath} add .
                sudo nix flake update --flake ${vars.configPath}
                sudo nixos-rebuild switch --flake ${vars.configPath}
              case clear
                sudo nix-collect-garbage -d
              case commit
                git -C ${vars.configPath} add .
                set -l diff_output (git -C ${vars.configPath} diff HEAD | string collect)
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
                git -C ${vars.configPath} commit -m "$response"
                git -C ${vars.configPath} push -u origin main
                echo "Succesfully committed with message \"$response\""
              case '*'
                echo "Unknown argument. Command list:"
                echo  " \033[1mn rebuild\033[1m - rebuilds system."
                echo  " \033[1mn update\033[1m - updates system."
                echo  " \033[1mn clear\033[1m - deletes system garbage."
                echo  " \033[1mn commit\033[1m - commits and pushes changes to github."
            end
        '';
      };
    };
    shellAliases = {
      ls = "lsd";
      lt = "ls --tree";
      tree = "ls --tree";
      cat = "bat -p";
    };
  };
}
