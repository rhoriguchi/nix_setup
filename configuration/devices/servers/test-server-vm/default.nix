{ pkgs, lib, ... }:
with lib;
let
  dataDir = "/tmp";
  syncDir = "${dataDir}/Sync";
in {
  imports = [ ../default.nix ./hardware-configuration.nix ];

  networking.hostName = "TEST-SERVER-VM";

  users.users.xxlpitu.password = mkForce "asdf1234";

  duckdns = {
    enable = true;
    subdomain = "xxlpitu-rain-town";
  };

  glances.enable = true;

  mal_export = {
    enable = true;
    exportPath = "${syncDir}/mal_export";
  };

  tv_time_export = {
    enable = true;
    exportPath = "${syncDir}/tv_time_export";
  };

  rslsync = {
    enable = true;
    syncPath = "${syncDir}";
  };

  log2ram.enable = true;

  systemd.services = {
    duckdns.enable = false;
    rslsync.enable = false;
  };
}
