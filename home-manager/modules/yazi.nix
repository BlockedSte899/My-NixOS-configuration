{ ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      preview = {
        image_delay = 100;
        image_filter = "lanczos3";
      };  
    };
  };
}
