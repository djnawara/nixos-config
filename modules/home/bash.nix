{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;

    initExtra = ''
      export PATH="$PATH:$HOME/.local/bin"
    '';
  };
}
