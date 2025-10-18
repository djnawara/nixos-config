{ pkgs, ...}:
{
  imports = [
    <plasma-manager/modules>
  ];

  programs = {
    plasma = {
      enable = true;

      workspace = {
        clickItemTo = "select";
        lookAndFeel = "org.kde.breezedark.desktop";
        cursor.theme = "Bibata-Modern-Ice";
        iconTheme = "Papirus-Dark";
      };

      panels = [];
    };
  };
}
