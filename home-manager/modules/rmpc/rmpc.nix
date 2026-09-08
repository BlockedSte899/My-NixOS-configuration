{ config, pkgs, lib, ... }:

{
  # rmpc
  programs.rmpc = {
    enable = true;
    config = ''
      (
        enable_config_hot_reload: true,
        theme: "custom-theme",
      )
    '';
  };

  # rmpc theme
  xdg.configFile."rmpc/themes/custom-theme.ron".source = ./custom-theme.ron;

  # mpd
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music/mpd/music";
    playlistDirectory = "${config.home.homeDirectory}/Music/mpd/playlists";
    network.startWhenNeeded = true;
#    package = pkgs.mpd.override {
#      features = [
#        "pipewire"
#        "opus"
#        "vorbis"
#        "sqlite"
#        "id3tag"
#        "syslog"
#        "systemd"
#      ];
#    };
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
        auto_update "yes"
      }
    '';
  };
  home.activation.createMpdMusicDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD mkdir -p $VERBOSE_ARG "${config.services.mpd.musicDirectory}"
    $DRY_RUN_CMD mkdir -p $VERBOSE_ARG "${config.services.mpd.playlistDirectory}"
  '';
  services.mpd-mpris = {
    enable = true;
  };
}
