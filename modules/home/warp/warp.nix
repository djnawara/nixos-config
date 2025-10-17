{ config, pkgs, ... }:

{
  home.file.".local/share/warp-terminal/themes/".source = pkgs.fetchFromGitHub {
    owner = "warpdotdev";
    repo = "themes";
    rev = "HEAD";
    sha256 = "8GHUFs1XAIuT+hF41n2zSMePTjaC2PCcVAFApVe6LDA=";
   };
}
