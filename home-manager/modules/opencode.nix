{ ... }:

{
  programs.opencode = {
    enable = true;
    settings = {
      "$schema" = "https://opencode.ai/config.json";

      plugin = [
        "opencode-failover"
      ];
    };
  };
}
        
