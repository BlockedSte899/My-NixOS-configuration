{ pkgs, ... }:

{
  programs.rmpc = {
    enable = true;

  };
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music/mpd/";
    network.startWhenNeeded = true;
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
    '';
    package = pkgs.mpd.override {
      features = [
        "pipewire"
        "opus"
        "vorbis"
        "sqlite"
        "id3tag"
        "syslog"
        "systemd"
      ];
    };  
  };
}
