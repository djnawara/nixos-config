{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.rider
    jetbrains.ruby-mine
    jetbrains.rust-rover
  ];
}
