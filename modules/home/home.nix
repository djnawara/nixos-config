{ config, pkgs, ... }:

{
  home.username = "dave";
  home.homeDirectory = "/home/dave";
  home.stateVersion = "25.05";

  imports = [
    ./waybar/waybar.nix
    ./warp/warp.nix
    ./git.nix
    ./ghostty.nix
    ./plasma.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    btop
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

  programs.bash.enable = true;
  services.ssh-agent.enable = true;
  services.swww.enable = true;
  services.swaync.enable = true;
}
