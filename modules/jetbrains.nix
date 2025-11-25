{pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pkgs.jetbrains.clion
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.pycharm-professional
    pkgs.jetbrains.rider
    pkgs.jetbrains.ruby-mine
    pkgs.jetbrains.rust-rover
  ];
}
