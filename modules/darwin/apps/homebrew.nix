{ config, pkgs, lib, ... }:

{
  # Darwin-level Homebrew configuration
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    brews = [
      "gh"
      "git"
      "helm"
      "k9s"
      "ansible"
    ];
    casks = [
      "ghostty"
    ];
  };
}