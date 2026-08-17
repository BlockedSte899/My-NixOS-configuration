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
  };

  # Github authentication token
  nix.extraOptions = '' !include ${config.age.secrets.github-token.path} '';
}
