{ config, lib, pkgs, ... }: {

  environment.variables = {
    EDITOR = "nvim";
    FLAKE = "/home/stacks/nixos-dotfiles";
  };

}
