{ lib, vars, ... }:

{
  plugin_settings."blockedste899/nix-config-generator".target_path = "${vars.configPath}/home-manager/modules/noctalia/generated.nix";
}
