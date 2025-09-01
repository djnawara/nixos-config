{pkgs, ...}:

{
  users.users.dave = {
    isNormalUser = true;
    description = "David Nawara";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ pkgs.zsh pkgs.oh-my-zsh pkgs.oh-my-posh ];
    hashedPassword = "$y$j9T$T0jcPnU/EAR1i94/y0JbM1$RF6H4zXKvSeR34OGFU0i9F/3XgEkU8FgKNzROcEqOdC";
    shell = pkgs.zsh;
  };
}