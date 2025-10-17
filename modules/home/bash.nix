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
    };

    # Your environment variables
    initExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/id_ed25519
    '';
  };
}
