{pkgs, ...}:

{
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };

  console.keyMap = "us";
}
