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
    pkgs.atlauncher
    pkgs.jetbrains.ruby-mine
    pkgs.wl-clipboard
    prismlauncher
    vim
    waveterm
    wget
  ];

  system.stateVersion = "25.05";
}
