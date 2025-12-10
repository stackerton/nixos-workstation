{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonvpn-gui
    alacritty
    nitrogen
    thunderbird
  ];
}
