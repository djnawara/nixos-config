{pkgs, ...}:

{
  programs = {
    git = {
      enable = true;

      settings = {
        user = {
          name = "Dave Nawara";
          email = "djnawara@gmail.com";
        };

        init.defaultBranch = "main";
        pull.rebase = true;
        color.ui = "auto";
      };
    };
  };
}
