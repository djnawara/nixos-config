{pkgs, ...}:

{
  networking.hostName = "daveloper-nix";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
}