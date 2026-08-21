{ inputs, ... }:

{
  imports = [
    inputs.xmcl.homeModules.xmcl
  ];

  programs.xmcl = {
    enable = true;
  };
}
