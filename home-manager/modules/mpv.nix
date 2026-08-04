{ inputs, ... }:

{
  programs.mpv = {
    enable = true;
    config = {
      # Don't close mpv when video ends
      keep-open = "yes";

      # Hardware acceleration
      hwdec = "auto";

      # Modern renderer
      vo = "gpu-next";

      # Cache limit
      demuxer-max-bytes = "100Mib";
      demuxer-max-back-bytes = "50Mib";
    };
  };
}