{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # VPN
    protonvpn-gui
    alacritty
  ];
}
