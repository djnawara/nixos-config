{ ... }:

{
  services = {
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    displayManager = {
      autoLogin = {
        enable = true;
        user = "dave";
      };

      sddm.enable = true;
    };

    desktopManager.plasma6.enable = true;
  };

  console.keyMap = "us";
}
