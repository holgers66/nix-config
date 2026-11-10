{ pkgs, ... }:
{
  # GUI apps come from Homebrew casks (homebrew.nix); keep nix packages to CLI tools.
  environment.systemPackages = with pkgs; [
    nix-zsh-completions
    tailscale
  ];
}
