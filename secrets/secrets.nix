let
  dave = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHF8hr4CY+3aObj73tTHtJR7KcZ/QGE+JufMANaZkMkC";
in
{
  "dave-password.age".publicKeys = [ dave ];
}
