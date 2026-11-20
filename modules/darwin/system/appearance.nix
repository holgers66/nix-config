{ username, ... }:
let
  home = "/Users/${username}";
in
{
  system.defaults.dock = {
    autohide = true;
    autohide-delay = 0.0; # no pause before the Dock appears
    autohide-time-modifier = 0.2; # fast show/hide animation (macOS default is 0.5)
    orientation = "bottom";
    mineffect = "scale";
    show-recents = false;
    tilesize = 72; # slightly larger than the macOS default of 64

    persistent-apps = [
      "/Applications/Google Chrome.app"
      "/Applications/Slack.app"
      "/Applications/Microsoft Teams.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/iTerm.app"
      "/Applications/1Password.app"
      "/Applications/Claude.app"
      "/Applications/Obsidian.app"
      "/Applications/Docker.app"
      "/System/Applications/System Settings.app"
      "/Applications/Tailscale.app"
      "/Applications/AWS VPN Client/AWS VPN Client.app"
      "/Applications/Bitwarden.app"
      "/Applications/TeamViewer.app"
      "/Applications/Granola.app"
    ];

    persistent-others = [
      "${home}/code"
      "${home}/Downloads"
    ];
  };

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyleSwitchesAutomatically = true; # light/dark follows time of day
    AppleIconAppearanceTheme = "RegularAutomatic";
    AppleShowScrollBars = "Always";
  };

  system.defaults.loginwindow = {
    GuestEnabled = false;
    LoginwindowText = "Holgers MacBook Pro";
  };
}
