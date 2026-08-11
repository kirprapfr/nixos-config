{ config, pkgs, ... }: {

  # Enable the Flatpak service
  services.flatpak.enable = true;

  # Ensure Flakes are still enabled
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
