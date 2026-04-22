{ config, lib, ... }:

{ 
  system.defaults.screencapture = {
    location = "~/Documents/Screenshots"; # Set default screenshot location
    # Add more screencapture settings here
    };

  system.defaults.trackpad = {
    TrackpadThreeFingerDrag = true; # Enable three-finger drag
    Clicking = true; # Enable tap to click
      # Add more trackpad settings here
      # You can find more trackpad settings by running `defaults read com.apple.AppleMultitouchTrackpad` in the terminal and adding the desired ones her
    # Set up your trackpad preferences here
  };

  system.defaults.controlcenter.Bluetooth = {
    ShowInMenuBar = "Always"; # Show Bluetooth in the menu bar
    # Add more Bluetooth settings here
  };

  system.defaults.controlcenter.Sound = {
    ShowInMenuBar = "Always"; # Show Sound in the menu bar
    # Add more Sound settings here
  };

  system.keyboard = {
    swapLeftCtrlAndFn = false; # Swap left control and function keys
    enableKeyMapping = true; # Enable key mapping
    # Set up your keyboard preferences here
  };

  system.primaryUser = "hschneider"; # Set the primary user for this system, used for some defaults and permissions
  system.defaults.screensaver.askForPassword = true; # Require password immediately after screensaver starts

}