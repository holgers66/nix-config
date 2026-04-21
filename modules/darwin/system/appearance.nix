{ config, pkgs, lib, username, ... }:
let
  homeDirectory = "/Users/${username}";
in
{  
  # If you also want to do e.g. Dock preferences from the same user-level file:
  system.defaults.dock = {
    autohide = true;
    orientation = "bottom";
    persistent-apps = [
      "/Applications/Ghostty.app"
      # Use the nixpkgs path to the app for apps installed via nix. This will automatically use the latest nix store path.
      "/${pkgs.slack}/Applications/Slack.app"
      # Add your persistent apps here
    ];
    persistent-others = [
      "${homeDirectory}/code"
      "${homeDirectory}/Downloads"
      "${homeDirectory}/Applications/Home Manager Apps"
      # Add your persistent others here
    ];
    show-recents = false;
    tilesize = 36; # Set the icon size on the dock; default is 64
  };

  system.defaults.NSGlobalDomain = {
    
    AppleInterfaceStyle = "Dark";     # "Dark" or "Light" - Darkmode all the things
    # Add more NSGlobalDomain settings here
  };

  system.defaults.loginwindow = {
    GuestEnabled = false; # Disable guest account
    LoginwindowText = "Holgers MacBook Pro"; # Set login window text
    # Add more loginwindow settings here
  };
}