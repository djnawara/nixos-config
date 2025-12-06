{ ... }:

{
  security.sudo = {
    extraConfig = ''
      Defaults        timestamp_timeout=600
    '';
    extraRules = [
      {
        users = [ "dave" ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild *";
            options = [ "NOPASSWD" ];
          }
          {
            command = "/run/current-system/sw/bin/nix *";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
