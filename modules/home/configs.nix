{ config, lib, pkgs, ... }:

let
  configDirs = [
    "hypr"
    "nvim"
    "wofi"
    "rofi"
    "foot"
    "waybar"
    "qtile"
    "alacritty"
  ];

  mkConfigLink = name: {
    source = config.lib.file.mkOutOfStoreSymlink "/home/stacks/nixos-dotfiles/config/${name}/";
    recursive = true;
  };
in

{
  xdg.configFile = builtins.listToAttrs (
    map (name: { name = name; value = mkConfigLink name; }) configDirs
  );

}
