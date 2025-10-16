{pkgs, ...}:

{
  networking = {
    hostName = "daveloper-nix";
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  };
}
