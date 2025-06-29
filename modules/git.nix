{pkgs, ...}:

{
  programs = {
    firefox.enable = true;

    git = {
      enable = true;

      config = {
        init.defaultBranch = "main";
        user = {
          name = "David Nawara";
          email = "djnawara@gmail.com";
        };
      };
    };
  };
}