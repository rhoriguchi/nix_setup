{ pkgs, config, ... }:
let
  configFile = (pkgs.formats.ini { }).generate "rhoriguchi" {
    User = {
      Icon = "${./icon.jpg}";
      Language = "";
      Session = "";
      SystemAccount = config.users.users.rhoriguchi.isSystemUser;
      XSession = "";
    };
  };
in {
  system.activationScripts.rhoriguchiSetIcon = ''
    ${pkgs.coreutils}/bin/ln -sf ${configFile} /var/lib/AccountsService/users/rhoriguchi
  '';
}
