{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ zsh ];

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
      ll = "ls -a -lgh --color";
      update = "sudo nixos-rebuild switch";
    };

    # Add to /etc/zshrc
    promptInit = ''
      export EDITOR=vim
    '';
  };

  # ''
  users.defaultUserShell = pkgs.zsh;
  system.userActivationScripts.zshrc = "touch .zshrc";
  environment.shells = [ pkgs.zsh ];
  environment.loginShellInit = ''
  '';
}