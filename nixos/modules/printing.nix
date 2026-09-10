{ pkgs, ... }:

let
  laserjet1020Firmware = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/inveneo/hub-linux-ubuntu/master/install/overlay/usr/share/foo2zjs/firmware/sihp1020.dl";
    hash = "sha256-wU/fCvhNHfQFRe73x9Ti4H3Vj+kz4UzHwpaXIJ6HzQE=";
  };

  hp1020FirmwareLoader = pkgs.writeShellScript "hp1020-firmware-loader" ''
    set -eu
    BACKEND=${pkgs.cups}/lib/cups/backend/usb
    FW=${laserjet1020Firmware}

    sleep 2

    found=0
    for uri in $("$BACKEND" 2>/dev/null \
        | ${pkgs.gnugrep}/bin/grep -i 'HP.*LaserJet.*1020' \
        | ${pkgs.gnugrep}/bin/grep -v FWVER \
        | ${pkgs.coreutils}/bin/cut -d ' ' -f 2); do
      found=1
      echo "hp1020-firmware: uploading firmware to $uri"
      if DEVICE_URI="$uri" "$BACKEND" 1 1 1 1 "" "$FW"; then
        echo "hp1020-firmware: upload to $uri succeeded"
      else
        echo "hp1020-firmware: upload to $uri failed" >&2
      fi
    done

    if [ "$found" -eq 0 ]; then
      echo "hp1020-firmware: firmware already loaded or printer not found"
    fi
  '';
in
{
  services.printing = {
    enable = true;
    drivers = [ pkgs.foo2zjs ];   # <-- было foo2zjsFw
  };

  systemd.services."hp1020-firmware" = {
    description = "Upload firmware to HP LaserJet 1020 over USB";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${hp1020FirmwareLoader}";
    };
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="03f0", ATTR{idProduct}=="2b17", TAG+="systemd", ENV{SYSTEMD_WANTS}+="hp1020-firmware.service"
  '';
}
