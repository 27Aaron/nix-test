{
  config,
  pkgs,
  lib,
  ...
}:
let
  myvars = import ../vars { inherit lib; };
in
{
  imports = [
    ./core
  ];

  home = {
    username = "${myvars.userName}";
    homeDirectory = "/home/${myvars.userName}";
    stateVersion = "${myvars.stateVersion}";
  };

  programs.home-manager.enable = true;
}
