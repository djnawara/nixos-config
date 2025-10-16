{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pkgs.jetbrains.clion
    pkgs.jetbrains.pycharm-professional
    pkgs.jetbrains.rider
    pkgs.jetbrains.ruby-mine
  ];
}
