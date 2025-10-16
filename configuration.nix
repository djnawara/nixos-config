{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  time.timeZone = "America/Detroit";

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "dave";
  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  security.polkit.enable = true;

  imports = [
      ./hardware-configuration.nix
      ./modules/hardware/nvidia.nix

      ./modules/audio.nix
      ./modules/desktop.nix
      ./modules/firefox.nix
      ./modules/git.nix
      ./modules/hyprland.nix
      ./modules/i18n.nix
      ./modules/jetbrains.nix
      ./modules/networking.nix
      ./modules/printing.nix
      ./modules/shell.nix
      ./modules/steam.nix
      ./modules/user.nix
    ];

  environment.systemPackages = with pkgs; [
    pkgs.prismlauncher
    pkgs.warp-terminal
    pkgs.wl-clipboard
    prismlauncher
    vim
    wget
  ];

  system.stateVersion = "25.05";
}
