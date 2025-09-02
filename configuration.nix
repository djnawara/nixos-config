{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./modules/hardware/nvidia.nix

      ./modules/audio.nix
      ./modules/desktop.nix
      ./modules/firefox.nix
      ./modules/git.nix
      ./modules/hyprland.nix
      ./modules/i18n.nix
      ./modules/networking.nix
      ./modules/printing.nix
      ./modules/shell.nix
      ./modules/steam.nix
      ./modules/user.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "America/Detroit";

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "dave";
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    pkgs.jetbrains.ruby-mine
    pkgs.prismlauncher
    pkgs.warp-terminal
    pkgs.wl-clipboard
    prismlauncher
    vim
    wget
  ];

  system.stateVersion = "25.05";
}
