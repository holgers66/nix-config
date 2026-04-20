{ pkgs, ... }:

{
  system.primaryUser = "hschneider";

  # CLI tools (replaces brew install)
  environment.systemPackages = with pkgs; [
    bat 
    fzf
    delta
    gh 
    lazygit 
    lsd 
    ripgrep
    tree
    iterm2
    vscode
    slack
  ];

  # add touch for sudo
  security.pam.services.sudo_local.touchIdAuth = true;

  # enable flakes, etc.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # GUI apps (declarative Homebrew)
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [ "linear-linear" "ghostty" ];
  };

  # macOS preferences
  system.defaults = {
    dock.autohide = true;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
  };

  # Determinate installer manages Nix itself
  # nix.enable = false;

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
