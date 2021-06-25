{ ... }: {
  imports = [ ../common.nix ./hardware-configuration.nix ];

  networking.hostName = "XXLPitu-AdGuard";

  services = {
    nginx = {
      virtualHosts."0.0.0.0" = {
        forceSSL = true;
        enableACME = true;

        locations."/".proxyPass = "http://127.0.0.1:3000";
        basicAuth.admin = (import ../../../../secrets.nix).services.adguard.password;
      };
    };

    # TODO create initial config yaml and than create with nix
    adguardhome.enable = true;
  };

  networking.firewall = {
    allowedTCPPorts = [ 53 3000 ];
    allowedUDPPorts = [ 53 ];
  };
}
