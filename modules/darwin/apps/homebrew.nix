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
      "pyenv"
      "copyclip"
      "the-unarchiver"
      "mstystudio"
      "pearcleaner"
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