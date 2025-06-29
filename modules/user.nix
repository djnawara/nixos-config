{pkgs, ...}:

{
  users.users.dave = {
    isNormalUser = true;
    description = "David Nawara";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    hashedPassword = "***REDACTED***";
  };
}