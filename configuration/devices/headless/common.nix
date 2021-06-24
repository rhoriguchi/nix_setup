{ pkgs, lib, config, ... }:
let
  fancyMotdConfig = pkgs.writeText "config.sh" ''
    # Max width used for components in second column
    WIDTH=75

    # Services to show
    declare -A services
    services["adguardhome"]="AdGuard Home"
    services["docker"]="Docker"
    services["duckdns"]="Duck DNS"
    services["plex"]="Plex"
    services["resilio"]="Resilio Sync"
    services["sshd"]="SSH"
    services["tv_time_export"]="TV Time export"
  '';
in {
  system.autoUpgrade = {
    enable = true;
    dates = "00:00";
  };

  nix.gc = {
    automatic = true;
    dates = "05:00";
    options = "--delete-older-than 7d";
  };

  networking.networkmanager = {
    ethernet.macAddress = "permanent";
    wifi.macAddress = "permanent";
  };

  console.keyMap = "de_CH-latin1";

  programs.zsh.shellInit = ''
    if (( EUID != 0 )); then
      # TODO add config to add services
      ${pkgs.fancy-motd}/bin/motd ${fancyMotdConfig}
    fi
  '';

  environment.systemPackages = [ pkgs.glances pkgs.htop ];

  users.users.xxlpitu = {
    extraGroups = [ "wheel" ] ++ lib.optional config.virtualisation.docker.enable "docker";
    isNormalUser = true;
    password = (import ../../secrets.nix).users.users.xxlpitu.password;
    openssh.authorizedKeys.keys = (import ../../authorized-keys.nix).keys;
  };
}