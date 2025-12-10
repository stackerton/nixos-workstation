{ config, lib, pkgs, ... }:

{
  imports = [
    ./services/systemd.nix
    ./services/fstrim.nix
    #    ./services/udisks.nix
    ./services/dbus.nix
    ./services/dconf.nix
    ./services/polkit.nix
    #    ./services/gvfs.nix
    #    ./services/wine.nix
    ./services/display-manager.nix
    ./services/xserver.nix

    #    ./system/documentation.nix
    ./system/audio.nix
    ./system/bluetooth.nix
    ./system/boot.nix
    ./system/xdg.nix
    ./system/fonts.nix
    ./system/applications.nix
    ./system/kernel.nix
    ./system/communication.nix
    ./system/locales.nix
    ./system/networking.nix
    ./system/nix.nix
    ./system/env.nix
    ./system/nvidia.nix
    #    ./system/shell.nix
    #  ./system/sudo.nix
    ./system/users.nix
    #    ./system/hyprland.nix
    ./system/storage.nix
    ./system/browsers.nix
    ./system/brave.nix
    ./system/podman.nix
  ];
}
