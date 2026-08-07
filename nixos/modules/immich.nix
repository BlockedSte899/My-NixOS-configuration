{ ... }:

{
  services.immich = {
    enable = false;
    host = "0.0.0.0";
    port = 2283;
    openFirewall = true;
    mediaLocation = "/var/lib/immich";
  };
}