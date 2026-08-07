{ ... }:

{
  hardware.bluetooth = {
    enable = true; # enables the bluetooth hardware
    powerOnBoot = true; # powers on the adapter on boot
    settings = {
      General = {
        ControllerMode = "dual";
        Experimental = "true";
      };
    };
  };
}
