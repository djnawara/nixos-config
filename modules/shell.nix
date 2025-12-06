{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      zsh
      meslo-lgs-nf
    ];

    etc."powerlevel10k/p10k.zsh".source = ./p10k.zsh;

    variables.EDITOR = "vim";
    sessionVariables.PATH = [ "$HOME/.local/bin" ];

    shellAliases = {
      grep = "grep --color=auto";
      ls = "lsd";
      ll = "lsd -alh --group-dirs first";
      cat = "bat";
      nshell = "nix-shell --run $SHELL";
      nix-update = "sudo nixos-rebuild switch --flake . --impure";
      nix-clean = "sudo nix-store --gc && sudo nix-collect-garbage --delete-old";
      nix-flake-update = "sudo nix flake update";
      nix-format = "nixfmt *.nix modules/*.nix modules/**/*.nix";
      wr = "ps aux | grep waybar | grep -v grep | awk '{print $2}' | xargs -I {} kill -2 {} && waybar & disown";
    };

    shells = [ pkgs.zsh ];
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    histSize = 10000;

    promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      source /etc/powerlevel10k/p10k.zsh

      if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';
  };

  users.defaultUserShell = pkgs.zsh;
  system.userActivationScripts.zshrc = "touch .zshrc";
}
