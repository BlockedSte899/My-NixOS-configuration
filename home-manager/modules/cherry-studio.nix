{ ... }:

let
  version = "2.1.6";
  pname = "cherry-studio";

  src = fetchurl {
    url = "https://github.com/CherryHQ/cherry-studio/releases/download/v${version}/Cherry-Studio-${version}-linux-x64.AppImage";
    hash = lib.fakeHash;
  };

  appimageContents = appimageTools.extractType1 { inherit name src; };
in
  appimageTools.wrapType2 rec {
    inherit pname version src;

    extraInstallCommands = ''
    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${meta.mainProgram}'
    '';

    meta = {
      description = "Desktop client that supports for multiple LLM providers";
      homepage = "https://github.com/CherryHQ/cherry-studio";
      downloadPage = "https://github.com/CherryHQ/cherry-studio/releases";
      platforms = [ "x86_64-linux" ];
    };
  }

  home.packages = [
    (pkgs.callPackage ./cherry-studio.nix {})
  ];
