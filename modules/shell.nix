{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    zsh
    meslo-lgs-nf
  ];

  environment.etc."powerlevel10k/p10k.zsh".source = ./p10k.zsh;

  environment.shellAliases = {
    nshell = "nix-shell --run $SHELL";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    shellAliases = { };

    # Add to /etc/zshrc
    promptInit = ''
      source ~/.bashrc

      export EDITOR=vim

      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source /etc/powerlevel10k/p10k.zsh

      if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
  };

  users.defaultUserShell = pkgs.zsh;
  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.shells = [ pkgs.zsh ];
}
