{pkgs, ...}:

{
  programs = {
    plasma = {
      enable = true;
      kwin.effects.blur.enable = true;
      kscreenlocker.autoLock = false;
      panels = [];

      workspace = {
        clickItemTo = "select";
        lookAndFeel = "org.kde.breezedark.desktop";
        cursor.theme = "capitaine-cursors";
        iconTheme = "Papirus-Dark";
      };
    };
  };
}
