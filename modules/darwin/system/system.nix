{ username, ... }:
{
  # Required for user-scoped system.defaults (dock, finder, ...)
  system.primaryUser = username;

  system.defaults = {
    screencapture.location = "~/Documents/Screenshots";
    screensaver.askForPassword = true;

    trackpad = {
      TrackpadThreeFingerDrag = true;
      Clicking = true; # tap to click
    };

    controlcenter = {
      Bluetooth = true;
      Sound = true;
    };
  };

  system.keyboard = {
    enableKeyMapping = true;
    swapLeftCtrlAndFn = false;
  };
}
