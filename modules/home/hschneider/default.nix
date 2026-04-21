{ config, pkgs, lib, ... }:
{
  imports = [
    ./terminal/default.nix
  ];

  home = {
    packages = with pkgs; [
      awscli2
      azure-cli
      go
      google-cloud-sdk
      kubectl
      krew
      slack
      teleport
      tmux
      vim
      vscode
    ];
  };
}