{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    windowManager.oxwm.enable = true;
  };

  # Recommended: Install a display manager
  #services.xserver.displayManager.lightdm.enable = true;
  # Or use another display manager like sddm, gdm, etc.
}
