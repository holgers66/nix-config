{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = "/Users/hschneider/.config/zsh";
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      k = "kubectl";
      ip = "ip --color=auto";
      rebuild = "sudo nix run nix-darwin --extra-experimental-features nix-command --extra-experimental-features flakes -- switch --flake .#Holger-MacBook-Pro";
    };

    plugins = with pkgs; [
      {
        name = "zsh-syntax-highlighting";
        src = fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
      }
    ];
  };

#  programs.fzf = {
#    enable = true;
#    enableZshIntegration = true;
#  };

  # Scripts
#  home.file.".config/zsh/scripts".source = ./files/scripts;
#  home.file.".config/zsh/scripts".recursive = true;
}