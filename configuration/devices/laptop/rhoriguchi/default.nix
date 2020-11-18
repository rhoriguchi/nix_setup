{ pkgs, config, ... }:
let userName = "rhoriguchi";
in {
  imports = [ ./dotfiles ./theme ];

  users.users."${userName}" = {
    extraGroups = [ "docker" "networkmanager" "vboxusers" "wheel" ];
    home = "/home/${userName}";
    isNormalUser = true;
  };

  home-manager.users."${userName}".home = {
    language = {
      base = "en_US.UTF-8";
      numeric = "de_CH.UTF-8";
      time = "de_CH.UTF-8";
      collate = "en_US.UTF-8";
      monetary = "de_CH.UTF-8";
      messages = "en_US.UTF-8";
      paper = "de_CH.UTF-8";
      measurement = "de_CH.UTF-8";
    };

    keyboard.layout = "ch";
  };

  # TODO make firefox default browser https://askubuntu.com/questions/16621/how-to-set-the-default-browser-from-the-command-line
}