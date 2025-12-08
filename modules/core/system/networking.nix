{ config, pkgs, ... }:
{
  # Enable NetworkManager
  networking.networkmanager.enable = true;
  networking.hostName = "nixos-btw";

  # Packages
  environment.systemPackages = with pkgs; [
    networkmanager
    networkmanagerapplet
  ];

}
