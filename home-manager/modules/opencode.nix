{ pkgs-unstable, osConfig, ... }:

{
  home.packages = with pkgs-unstable; [ mcp-nixos playwright-mcp ]; 
  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      provider = { 
        dahl = {
          npm = "@ai-sdk/openai-compatible";
          name = "Dahl";
          options = {
            baseURL = "https://inference.dahl.global/v1";
            apiKey = "{file:${osConfig.age.secrets."dahl-api-key".path}}";
          };
          models = {
            "MiniMaxAI/MiniMax-M2.7" = { 
              name = "MiniMax M2.7";
              limit.context = 180000;
              limit.output = 8192; # IDK the actual limit
            };
            "deepseek-ai/DeepSeek-V4-Flash-0731" = {
              name = "DeepSeek V4 Flash 0731";
              limit.context = 400000;
              limit.output = 8192; # IDK the actual limit
            };
            "zai-org/GLM-5.3-Flash" = {
              name = "GLM 5.3 Flash";
              limit.context = 400000;
              limit.output = 8192; # IDK the actual limit
            };
          };
        };
        nvidia = {
          npm = "@ai-sdk/openai-compatible";
          name = "Nvidia NIM";
          options = {
            baseURL = "https://integrate.api.nvidia.com/v1";
            apiKey = "{file:${osConfig.age.secrets."nvidia-api-key".path}}";
          };
          models = {
            "z-ai/glm-5.3" = {
              name = "GLM 5.3";
              limit.context = 1000000;
              limit.output = 944000;
            };
            "z-ai/glm-5.3-flash" = {
              name = "GLM 5.3 Flash";
              limit.context = 1000000;
              limit.output = 944000;
            };
          };
        };
      };
      plugin = [
        "@dietrichgebert/ponytail"
      ];
      mcp = {
        nixos = {
          enabled = true;
          type = "local";
          command = [ "${pkgs-unstable.mcp-nixos}/bin/mcp-nixos" ];
        };
        context7 = {
          enabled = true;
          type = "remote";
          url = "https://mcp.context7.com/mcp";
        };
        exa = {
          enabled = true;
          type = "remote";
          url = "https://mcp.exa.ai/mcp";
          headers = {
            "x-api-key" = "{file:${osConfig.age.secrets."exa-api-key".path}}";
          };
        };
        playwright-port-9222 = {
          enabled = true;
          type = "local";
          command = [ "${pkgs-unstable.playwright-mcp}/bin/playwright-mcp" "--cdp-endpoint" "http://127.0.0.1:9222" ];
        };
      };
    };
  };
}
