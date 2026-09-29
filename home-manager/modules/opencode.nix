{ pkgs-unstable, osConfig, ... }:

{
  home.packages = with pkgs-unstable; [ mcp-nixos ]; 
  programs.opencode = {
    enable = true;
    package = pkgs-unstable.opencode;
    settings = {
      provider.dahl = {
        npm = "@ai-sdk/openai-compatible";
        name = "Dahl";
        options = {
          baseURL = "https://inference.dahl.global/v1";
          apiKey = "{file:${osConfig.age.secrets."dahl-api-key".path}}";
        };
        models = {
          "MiniMaxAI/MiniMax-M2.7".name = "MiniMax M2.7";
          "deepseek-ai/DeepSeek-V4-Flash-0731".name = "DeepSeek V4 Flash 0731";
          "zai-org/GLM-5.3-Flash".name = "GLM 5.3 Flash";
        };
      };
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
      };
    };
  };
}
