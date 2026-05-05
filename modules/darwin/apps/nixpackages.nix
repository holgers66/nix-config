{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
#      google-cloud-sdk
      nix-zsh-completions
#      imagemagick
#      ffmpeg
#      yt-dlp
#      p7zip
#      jq
#      jo
#      jless
#      yq
#      fzf
#      dbeaver-bin
#      raycast
#      rectangle
  ];
}
