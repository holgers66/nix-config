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
      "the-unarchiver"
      "mstystudio"
      "pearcleaner"
      "helium-browser"
      "powerlevel10k"
      "bat"
      ];
  };
}