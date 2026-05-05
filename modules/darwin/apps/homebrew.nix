{ config, pkgs, lib, ... }:

{
  # Darwin-level Homebrew configuration
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    enableZshIntegration = true;
    global.autoUpdate = true;

    brews = [
      "kubernetes-cli"
      "iproute2mac"
      "bat"
      "helm"
      "docker"
      "pyenv"
      "stern"
      "vim"
      "awscli"
      "azure-cli"
      "go"
    ];
    casks = [
      "windows-app"
      "zoom"
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
      "tailscale-app"
      "1password"
      "gcloud-cli"
      ];
  };
}