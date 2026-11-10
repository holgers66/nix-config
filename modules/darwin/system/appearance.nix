{ username, ... }:
let
  home = "/Users/${username}";
in
{
  system.defaults.dock = {
    autohide = true;
    orientation = "bottom";
    mineffect = "scale";
    show-recents = false;
    tilesize = 48;

    persistent-apps = [
      "/System/Applications/Calendar.app"
      "/Applications/Google Chrome.app"
      "/Applications/Slack.app"
      "/Applications/Visual Studio Code.app"
      "/Applications/iTerm.app"
      "/Applications/1Password.app"
      "/Applications/Claude.app"
      "/Applications/Obsidian.app"
      "/Applications/Docker.app"
      "/System/Applications/System Settings.app"
      "/Applications/Pearcleaner.app"
      "/Applications/Tailscale.app"
      "/Applications/AWS VPN Client/AWS VPN Client.app"
      "/Applications/Bitwarden.app"
      "/Applications/TeamViewer.app"
      "/Applications/Moonlight.app"
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
