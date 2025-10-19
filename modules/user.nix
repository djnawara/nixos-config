{pkgs, ...}:

{
  users.users.dave = {
    isNormalUser = true;
    description = "Daveloper";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [ pkgs.zsh pkgs.oh-my-zsh pkgs.oh-my-posh ];
    hashedPassword = "***REDACTED***";
    shell = pkgs.zsh;
  };
}
