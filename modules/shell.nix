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

    shellAliases = {
      grep = "grep --color=auto";
      ls = "lsd";
      ll = "lsd -alh --group-dirs first";
      cat = "bat";
      nix-update = "sudo nixos-rebuild switch --flake . --impure";
      nix-clean = "sudo nix-store --gc && sudo nix-collect-garbage --delete-old";
      wr = "ps aux | grep waybar | grep -v grep | awk '{print $2}' | xargs -I {} kill -2 {} && waybar & disown";
    };

    # Add to /etc/zshrc
    promptInit = ''
      export EDITOR=vim

      export PATH="$PATH:$HOME/.local/bin"
      eval "$(ssh-agent -s)"
      ssh-add ~/.ssh/id_ed25519

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
