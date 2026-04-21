{ config, pkgs, lib, ... }:
{
  imports = [
    ./terminal/default.nix
  ];

  home = {
    packages = with pkgs; [];
  };
}