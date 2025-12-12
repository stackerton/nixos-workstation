{ config, lib, pkgs, ... }: {

  users.users.stacks = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "audio" "video" "disk" "docker" "libvirtd" "vboxusers" ];
    #      shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };
}
