{ config, pkgs, lib, ... }:

{
  # Darwin-level Homebrew configuration
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    enableZshIntegration = true;
    global.autoUpdate = true;

    brews = [
      "iproute2mac"
      "bat"
      "helm"
      "docker"
    ];
    casks = [
      "windows-app"
      "copyclip"
      "the-unarchiver"
      "mstystudio"
      "pearcleaner"
      "helium-browser"
      "font-meslo-for-powerlevel10k"
      "maccy"
      "rancher"
      "caffeine"
      "grammarly-desktop"
      "claude"
      "rapidapi"
      ];
  };
}