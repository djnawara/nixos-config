{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      grep = "grep --color=auto";
      ls = "lsd";
      ll = "lsd -alh --group-dirs first";
      cat = "bat";
      update = "sudo nixos-rebuild switch --flake .";
    };

    # Your environment variables
    initExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';
  };
}
