{
  config,
  lib,
  pkgs,
  ...
}:
let
  myvars = import ../../../vars { inherit lib; };
in
{
  imports = [
    ···
    ./caddy.nix
    ./network.nix
    ··· 
  ];

  systemd.network.enable = true;
  services.resolved.enable = false;
  networking.useDHCP = false;
  networking.hostName = "bj-alibaba";

  system.stateVersion = "${myvars.stateVersion}";

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    priority = 5;
  };
}
