{ osConfig, ... }:

{
  programs.prismlauncher = {
    enable = true;
    settings = {
      FlameKeyOverride = "${osConfig.age.secrets."curseforge-api-key".path}";
      MaxMemAlloc = 8192;
    };  
  };
}
