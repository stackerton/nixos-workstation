{ config, pkgs, ... }:
{
  # System-level browser installations
  environment.systemPackages = with pkgs; [
    mullvad-browser
    tor-browser
    brave
  ];
}
