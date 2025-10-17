{ config, pkgs, ... }:

{
  home.username = "dave";
  home.homeDirectory = "/home/dave";
  home.stateVersion = "25.05";

  imports = [
    ./waybar/waybar.nix
    ./niri/niri.nix
    ./warp/warp.nix
    ./bash.nix
    ./ghostty.nix
    ./tmux.nix
    ./wofi.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    btop
    neovim
    tmux
    starship
    swaynotificationcenter
    waybar-mpris
    playerctl
    waypaper
    waybar
    swaylock
    swww
  ];

  gtk = {
    enable = true;
    theme.name = "Adwaita-dark";
    colorScheme = "dark";
  };

  qt = {
    style.name = "adwaita-dark";
  };

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    package = pkgs.catppuccin-cursors.mochaSapphire;
      name = "catppuccin-mocha-sapphire-cursors";
    size = 12;
  };

  programs = {
    git = {
      enable = true;
      userName = "djnawara";
      userEmail = "djnawara@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        color.ui = "auto";
      };
    };
  };

  programs.bash.enable = true;
  services.swww.enable = true;
  services.swaync.enable = true;
}
