{ config, pkgs, ... }:

{
  # ... your existing Podman config (keep this) ...
  virtualisation.podman = {
    enable = true;
    dockerCompat = false; # Disable if you want pure Podman (optional; set true if you still need some docker aliases)
    defaultNetwork.settings.dns_enabled = true; # Critical for compose networking
  };

  virtualisation.containers.enable = true; # Helps with volumes/networks

  # Install podman-compose (and optional tools)
  environment.systemPackages = with pkgs; [
    podman-compose # The star of the show
    podman-tui # Optional: TUI for monitoring containers
    # dive           # Optional: Inspect image layers
  ];
}
