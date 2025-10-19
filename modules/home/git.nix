{pkgs, ...}:

{
  programs = {
    git = {
      enable = true;
      userName = "Dave Nawara";
      userEmail = "djnawara@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        color.ui = "auto";
      };
    };
  };
}
