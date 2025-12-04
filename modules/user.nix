{pkgs, ...}:

{
  users.users.dave = {
    isNormalUser = true;
    description = "Daveloper";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ zsh oh-my-zsh oh-my-posh ];
    hashedPassword = "***REDACTED***";
    shell = pkgs.zsh;
  };
}
