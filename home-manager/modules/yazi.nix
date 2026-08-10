{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      preview = {
        image_delay = 100;
        image_filter = "lanczos3";
      };  
    };
    plugins = {
      full-border = {
        setup = true;
        package = pkgs.yaziPlugins.full-border;
      };
      git = {
        setup = true;
        package = pkgs.yaziPlugins.git;
      };
    };
  };
}
