{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      cat = "bat --style=header,grid";
      ls = "lsd";
      lg = "lazygit";
      rebuild = "sudo ./result/sw/bin/darwin-rebuild switch --flake .#mbp"
    };
    initContent = ''
      eval "$(fnm env --use-on-cd --shell zsh)"
      # ... rest of your shell config
    '';
  };

  programs.git = {
    enable = true;
    settings = {
      user.name = "holgers66";
      user.email = "holger.schneider@gmail.com";
      push.autoSetupRemote = true;
    };
  };

  programs.starship.enable = true;

  home.stateVersion = "25.11";
}
