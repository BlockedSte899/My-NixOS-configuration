{ pkgs, appimageTools, lib, fetchurl, ... }:

let
  version = "2.1.6";
  pname = "cherry-studio";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://github.com/CherryHQ/cherry-studio/releases/download/v${version}/Cherry-Studio-${version}-linux-x64.AppImage";
    hash = "sha256-0jvk4QoPLles2P87iSdkvM8RWsg34pIppTLVxEI+EfE=";
  };

  appimageContents = appimageTools.extract { inherit pname version src; };
in
  appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      install -Dm444 ${appimageContents}/CherryStudio.desktop \
      $out/share/applications/${pname}.desktop

      substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'

      mkdir -p $out/share
      cp -r --no-preserve=mode ${appimageContents}/usr/share/icons $out/share/
    '';

    meta = {
      description = "Desktop client that supports for multiple LLM providers";
      homepage = "https://github.com/CherryHQ/cherry-studio";
      mainProgram = pname;
      downloadPage = "https://github.com/CherryHQ/cherry-studio/releases";
      platforms = [ "x86_64-linux" ];
    };

    home.packages = [
      (pkgs.callPackage ./cherry-studio.nix {})
    ];
  }
  
