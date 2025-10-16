{pkgs, ...}:

{
  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services = {
    displayManager = {
      enable = true;
      ly.enable = true;
    };

    xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };
}
