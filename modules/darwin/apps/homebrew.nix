{ config, pkgs, lib, ... }:

{
  # Darwin-level Homebrew configuration
  homebrew = {
    enable = false;
    onActivation.cleanup = "uninstall";

    brews = [];
    casks = [];
  };
}