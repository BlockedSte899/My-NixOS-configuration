{ vars, config, ... }:

{
  # Agenix
  age.secrets = {
    github-token = {
      file = "${vars.configPath}/secrets/github-token.age";
      mode = "0400";
    };
    gemini-api-key = {
      file = "${vars.configPath}/secrets/gemini-api-key.age";
      mode = "0400";
    };
    curseforge-api-key = {
      file = "${vars.configPath}/secrets/curseforge-api-key.age";
      mode = "0400";
    };
    dahl-api-key = {
      file = "${vars.configPath}/secrets/dahl-api-key.age";
      owner = "nikita";
      mode = "0400";
    };
    exa-api-key = {
      file = "${vars.configPath}/secrets/exa-api-key.age";
      owner = "nikita";
      mode = "0400";
    };
    nvidia-api-key = {
      file = "${vars.configPath}/secrets/nvidia-api-key.age";
      owner = "nikita";
      mode = "0400";
    };
  };

  # Github authentication token
  nix.extraOptions = '' !include ${config.age.secrets.github-token.path} '';
}
