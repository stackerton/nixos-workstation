{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/core
      ./modules/media
      ./modules/core/services/oxwm
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";
    targets.plymouth.enable = false;
    #    targets.libreoffice.enable = false;
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    foot
    git
    fastfetch
  ];

  system.stateVersion = "25.11";
}

