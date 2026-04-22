{ config, pkgs, lib, ... }:

{
  # Darwin-level Homebrew configuration
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";

    brews = [];
    casks = [
      "windows-app"
      "copyclip"
      "alt-tab"
      "the-unarchiver"
      "mstystudio"
      "pearcleaner"
      ];
  };
}