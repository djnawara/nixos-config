{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  time.timeZone = "America/Detroit";

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
      ./hardware-configuration.nix

      ./modules/audio.nix
      ./modules/desktop.nix
      ./modules/firefox.nix
      ./modules/fonts.nix
      ./modules/i18n.nix
      ./modules/jetbrains.nix
      ./modules/neovim.nix
      ./modules/networking.nix
      ./modules/printing.nix
      ./modules/security.nix
      ./modules/shell.nix
      ./modules/steam.nix
      ./modules/user.nix
    ];

  environment.systemPackages = with pkgs; [
    adw-gtk3
    bat
    btop
    chromium
    claude-code
    curl
    discord
    docker
    docker-compose
    fastfetch
    ffmpeg
    ghostty
    gnumake
    helix
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
    polkit
    prismlauncher
    tmux
    vim
    warp-terminal
    wget
    wireshark
    wl-clipboard-rs
    wlogout
    zed-editor
    zoom-us
  ];

  security.polkit.enable = true;
  virtualisation.docker.enable = true;

  system.stateVersion = "25.05";
}
