{ pkgs, config, ... }:

{
  users.users.dave = {
    isNormalUser = true;
    description = "Daveloper";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    packages = with pkgs; [
      zsh
      oh-my-zsh
      oh-my-posh
    ];
    hashedPasswordFile = config.age.secrets.dave-password.path;
    shell = pkgs.zsh;
  };
}
