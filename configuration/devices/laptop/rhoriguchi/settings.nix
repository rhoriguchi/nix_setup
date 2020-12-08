{ pkgs, ... }:
# TODO hand this over as variable
let username = "rhoriguchi";
in {
  home-manager.users."${username}".dconf = {
    enable = true;

    # TODO find out what is really needed
    settings = {
      "ca/desrt/dconf-editor/Settings".show-warning = false;
      "org/gnome/desktop/interface".gtk-enable-primary-paste = false;
      "org/gnome/desktop/wm/preference" = {
        action-middle-click-titlebar = "none";
        num-workspaces = 1;
      };
      "org/gnome/gedit/plugins/filebrowser".filter-mode = [ "hide-binary" ];
      "org/gnome/gedit/preferences/editor" = {
        display-line-numbers = true;
        insert-spaces = true;
        tabs-size = 4;
      };
      "org/gnome/login-screen" = {
        enable-fingerprint-authentication = false;
        enable-smartcard-authentication = false;
      };
      "org/gnome/mutter".dynamic-workspaces = false;
      "org/gnome/nautilus/preferences".show-hidden-files = true;
      "org/gnome/settings-daemon/plugins/power".power-button-action = "suspend";
      "org/gnome/shell".favorite-apps = [ ];

      # keybindings
      "org/freedesktop/ibus/general/hotkey" = {
        next-engine = [ ];
        next-engine-in-menu = [ ];
        trigger = [ ];
        triggers = [ ];
      };
      "org/freedesktop/ibus/panel/emoji" = {
        hotkey = [ ];
        unicode-hotkey = [ ];
      };
      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = [ ];
        begin-move = [ ];
        begin-resize = [ ];
        close = [ "<Alt>F4" ];
        cycle-group = [ ];
        cycle-group-backward = [ ];
        cycle-panels = [ ];
        cycle-panels-backward = [ ];
        cycle-windows = [ ];
        cycle-windows-backward = [ ];
        minimize = [ ];
        move-to-monitor-down = [ ];
        move-to-monitor-left = [ ];
        move-to-monitor-right = [ ];
        move-to-monitor-up = [ ];
        move-to-workspace-1 = [ ];
        move-to-workspace-down = [ ];
        move-to-workspace-last = [ ];
        move-to-workspace-left = [ ];
        move-to-workspace-right = [ ];
        move-to-workspace-up = [ ];
        panel-main-menu = [ ];
        show-desktop = [ "<Super>d" ];
        switch-applications-backward = [ ];
        switch-group = [ ];
        switch-group-backward = [ ];
        switch-input-source = [ ];
        switch-input-source-backward = [ ];
        switch-panels = [ ];
        switch-panels-backward = [ ];
        switch-to-workspace-1 = [ ];
        switch-to-workspace-down = [ ];
        switch-to-workspace-last = [ ];
        switch-to-workspace-up = [ ];
        switch-windows-backward = [ ];
        toggle-maximized = [ "<Super>Up" ];
        unmaximize = [ ];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        area-screenshot = [ ];
        area-screenshot-clip = [ ];
        calculator-static = [ ];
        email = [ ];
        email-static = [ ];
        help = [ ];
        home = [ ];
        logout = [ ];
        magnifier = [ ];
        magnifier-zoom-in = [ ];
        magnifier-zoom-out = [ ];
        screencast = [ "<Ctrl><Shift><Alt>R" ];
        screenreader = [ ];
        screenshot = [ ];
        screenshot-clip = [ ];
        terminal = [ "<Alt>t" ];
        window-screenshot = [ ];
        window-screenshot-clip = [ ];
        www = [ ];
        www-static = [ ];
      };
      "org/gnome/shell/keybindings" = {
        focus-active-notification = [ ];
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
        switch-to-application-5 = [ ];
        switch-to-application-6 = [ ];
        switch-to-application-7 = [ ];
        switch-to-application-8 = [ ];
        switch-to-application-9 = [ ];
        toggle-application-view = [ ];
        toggle-message-tray = [ ];
        toggle-overview = [ ];
      };
    };
  };
}