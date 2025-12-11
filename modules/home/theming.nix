{ config, pkgs, ... }:
{
  # Proper cursor configuration - the NixOS way
  home.pointerCursor = {
    name = "Nordzy-cursors-white"; # This is the correct name
    package = pkgs.nordzy-cursor-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "Zafiro-icons-Dark";
      package = pkgs.zafiro-icons;
    };
  };

  #  wayland.windowManager.hyprland.settings = {
  #    exec-once = [
  #      "gsettings set org.gnome.desktop.interface cursor-theme 'Nordzy-cursors-white'"
  #      "gsettings set org.gnome.desktop.interface cursor-size 24"
  #    ];
  #  };
}
