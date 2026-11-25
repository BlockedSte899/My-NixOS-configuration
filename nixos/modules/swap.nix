{ lib, ... }:

{
  swapDevices = [
    {
      device = "/swapfile";
      size = 16384;
    }
  ];

  zramSwap = {
    enable = true;
    memoryPercent = 30; # Maximum total amount of memory that can be stored in the zram swap devices
    algorithm = "zstd";
  };
}
