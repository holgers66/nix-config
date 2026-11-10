{ lib, username, ... }:
{
  imports = [ ./terminal ];

  home = {
    stateVersion = "24.11";
    homeDirectory = lib.mkForce "/Users/${username}";
  };
}
