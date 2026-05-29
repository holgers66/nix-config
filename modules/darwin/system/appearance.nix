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
      "/System/Applications/Calendar.app"
      "/Applications/Google Chrome.app"      
      # "/Applications/Safari.app"
      # Use the nixpkgs path to the app for apps installed via nix. This will automatically use the latest nix store path.
      "/Applications/Slack.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/iTerm.app"
      "/Applications/1Password.app"
      "/Applications/Claude.app"
      "/Applications/Obsidian.app"
      "/Applications/Rancher Desktop.app"
      "/Applications/Windows App.app"
      "/System/Applications/System Settings.app"
      "/Applications/zoom.us.app"
      "/Applications/DBeaver.app"
      "/Applications/Raycast.app"
      "/Applications/Pearcleaner.app"
      "/Applications/LibreOffice.app"
      "/Applications/Tailscale.app"
      "/Applications/AWS VPN Client/AWS VPN Client.app"
       # Add more persistent apps here
       # Example: "/Applications/YourApp.app"
       # For nix-installed apps, use the nix store path as shown above
       # Example: "/${pkgs.your-nix-package}/Applications/YourApp.app"
       # You can also mix both approaches as needed
       # Example: "/Applications/AnotherApp.app"
      # Add your persistent apps here
    ];
    persistent-others = [
      "${homeDirectory}/code"
      "${homeDirectory}/Downloads"
      # Add your persistent others here
    ];
    show-recents = false;
    tilesize = 48; # Set the icon size on the dock; default is 64
  };

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyleSwitchesAutomatically = true; # Automatically switch between Light and Dark mode based on time of day
#    AppleInterfaceStyle = "Light";     # "Dark" or "Light" - Darkmode all the things
    AppleIconAppearanceTheme = "RegularAutomatic"; # "RegularDark" or "HighContrastDark" - Dark mode icons
    # Add more NSGlobalDomain settings here
  };

  system.defaults.NSGlobalDomain.AppleShowScrollBars = "Always"; # Show scroll bars always (other options: "WhenScrolling", "Automatic")

  system.defaults.dock.mineffect = "scale"; # Set the minimize effect to "scale" (other options: "genie", "suck", "scale")

  system.defaults.loginwindow = {
    GuestEnabled = false; # Disable guest account
    LoginwindowText = "Holgers MacBook Pro"; # Set login window text
    # Add more loginwindow settings here
  };
}
