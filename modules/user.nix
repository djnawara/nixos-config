{pkgs, ...}:

{
  users.users.dave = {
    isNormalUser = true;
    description = "David Nawara";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ pkgs.zsh pkgs.oh-my-zsh pkgs.oh-my-posh ];
    hashedPassword = "***REDACTED***";
    shell = pkgs.zsh;
  };
}