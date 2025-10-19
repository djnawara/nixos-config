{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "America/Detroit";
  i18n.defaultLocale = "en_US.UTF-8";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
      ./hardware-configuration.nix
      ./modules/hardware/nvidia.nix

      ./modules/audio.nix
      ./modules/desktop.nix
      ./modules/firefox.nix
      ./modules/fonts.nix
      ./modules/i18n.nix
      ./modules/jetbrains.nix
      ./modules/neovim.nix
      ./modules/networking.nix
      ./modules/printing.nix
      ./modules/shell.nix
      ./modules/steam.nix
      ./modules/user.nix
      ./modules/wireshark.nix
    ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
    bat
    btop
    curl
    discord
    docker
    docker-compose
    fastfetch
    ffmpeg
    ghostty
    gnumake
    killall
    lazydocker
    lsd
    neovim
    nh
    nixfmt-rfc-style
    nmap
    nvidia-modprobe
    openvpn
    papirus-icon-theme

    pkgs.prismlauncher
    pkgs.warp-terminal

    polkit
    prismlauncher
    tmux
    vim
    wget
    wireshark
    wl-clipboard-rs
    wlogout
  ];

  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  system.stateVersion = "25.05";
}
