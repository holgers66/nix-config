{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
}
