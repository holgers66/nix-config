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
    vscode
  ];

  # GUI apps (declarative Homebrew)
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    casks = [ "slack" "linear-linear" "ghostty" ];
  };

  # macOS preferences
  system.defaults = {
    dock.autohide = true;
    dock.mru-spaces = false;
    finder.AppleShowAllFiles = true;
    finder.AppleShowAllExtensions = true;
    finder.FXPreferredViewStyle = "clmv";
  };

  # Determinate installer manages Nix itself
  # nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = 6;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
