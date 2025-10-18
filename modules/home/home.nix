{ config, pkgs, ... }:

{
  home.username = "dave";
  home.homeDirectory = "/home/dave";
  home.stateVersion = "25.05";

  imports = [
    <home-manager/nixos>
    ./waybar/waybar.nix
    ./warp/warp.nix
    ./ghostty.nix
    ./tmux.nix
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

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.sharedModules = [ <plasma-manager/modules> ];

  home-manager.users.daveloper-nix = { pkgs, ... }: {
    programs.plasma = {
      enable = true;
      panels = [];

      kwin.effects.blur.enable = true;
      kscreenlocker.autoLock = false;
    };
  };
}
