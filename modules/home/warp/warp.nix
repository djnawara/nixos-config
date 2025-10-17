{ config, pkgs, ... }:

{
  home.file.".local/share/warp-terminal/themes/daveloper.yml".source = ./daveloper.yml;
}
