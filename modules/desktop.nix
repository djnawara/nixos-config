{pkgs, ...}:

{
  services = {
    displayManager = {
      enable = true;
      ly.enable = true;
      defaultSession = "xfce";
    };

    xserver = {
      desktopManager = {
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
        };
      };

      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  console.keyMap = "us";
}
