{pkgs, ...}:

{
  programs = {
    git = {
      enable = true;
      user = {
        name = "Dave Nawara";
        email = "djnawara@gmail.com";
      };
      settings = {
        init.defaultBranch = "main";
        pull.rebase = true;
        color.ui = "auto";
      };
    };
  };
}
