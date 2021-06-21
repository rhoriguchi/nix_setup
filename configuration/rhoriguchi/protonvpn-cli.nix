{ pkgs, config, ... }:
let
  username = "";
  password = "";

  configFile = (pkgs.formats.ini { }).generate "pvpn-cli.cfg" ({
    USER = {
      username = username;

      custom_dns = "None";
      dns_leak_protection = 1;
      killswitch = 0;
      split_tunnel = 0;
      tier = 2;
      user_protocol = "udp";

      api_domain = "https://api.protonvpn.ch";
      check_update_interval = 3;

      initialized = 1;
    };

    metadata = {
      last_api_pull = 0;
      last_update_check = 0;
    };
  });

  credentialsFile = pkgs.writeText "pvpnpass" ''
    ${username}
    ${password}
  '';

  configDir = "${config.users.users.rhoriguchi.home}/.pvpn-cli";
in {
  system.userActivationScripts.configureProtonvpn = ''
    ${pkgs.coreutils}/bin/mkdir -p ${configDir}
    ${pkgs.coreutils}/bin/chown -R rhoriguchi:users ${configDir}

    ${pkgs.coreutils}/bin/cp -f ${configFile} ${configDir}/pvpn-cli.cfg
    ${pkgs.coreutils}/bin/chmod 644 ${configDir}/pvpn-cli.cfg
    ${pkgs.coreutils}/bin/chown rhoriguchi:users ${configDir}/pvpn-cli.cfg

    ${pkgs.coreutils}/bin/cp -f ${credentialsFile} ${configDir}/pvpnpass
    ${pkgs.coreutils}/bin/chmod 600 ${configDir}/pvpnpass
    ${pkgs.coreutils}/bin/chown root:root ${configDir}/pvpnpass
  '';
}
