{ ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      shell_integration = "no-cursor";
      cursor_shape = "block";
      cursor_trail = 1;
      confirm_os_window_close = 0;
      enable_audio_bell = "no";
    };  
  };
}
