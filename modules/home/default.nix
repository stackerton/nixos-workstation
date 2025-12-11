{ config, pkgs, lib, ... }:
{
  imports = [
    ./theming.nix
    ./gaming.nix
    ./configs.nix
    ./git.nix

    ./apps/btop.nix
    ./apps/picom.nix
    ./apps/programs.nix
    ./apps/dunst.nix
  ];

  home.username = "stacks";
  home.homeDirectory = "/home/stacks";
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use hyprland btw";
      nrs = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw";
      vim = "nvim";
      ff = "fastfetch";
    };
    initExtra = ''
      export PS1='\[\e[38;5;76m\]\u\[\e[0m\] in \[\e[38;5;32m\]\w\[\e[0m\] \\$ '
      nitch
    '';
  };

  programs.home-manager.enable = true;

  programs.nix-index = {
    enable = true;
    enableBashIntegration = true;
  };
}
