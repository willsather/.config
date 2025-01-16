{pkgs, ...}:
###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  system = {
    # Used for backwards compatibility, please read the changelog before changing.
    stateVersion = 5;

    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    keyboard = {
      enableKeyMapping = true;

      # NOTE: do NOT support remap capslock to both control and escape at the same time
      remapCapsLockToControl = false; # remap caps lock to control, useful for emac users
      remapCapsLockToEscape = true; # remap caps lock to escape, useful for vim users
    };

    defaults = {
      # cuatomize clock
      menuExtraClock = {
        Show24Hour = false;
        ShowAMPM = true;
        ShowSeconds = true;
      };

      # customize finder
      finder = {
        AppleShowAllFiles = true; # show hidden files
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
        QuitMenuItem = true; # enable quit menu item

        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        _FXShowPosixPathInTitle = true; # show full path in finder title
      };

      screencapture.location = "~/Pictures/screenshots"; # screenshot location
      screensaver.askForPasswordDelay = 10; # in seconds

      # customize dock
      dock = {
        autohide = false;
        show-recents = false;
        mru-spaces = false;

        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Arc.app"
          "/Applications/Slack.app"
          "/Applications/IntelliJ IDEA Ultimate.app"
          "/Applications/Ghostty.app"
          "/System/Applications/System Settings.app"
        ];
      };

      # customize trackpad
      trackpad = {
        Clicking = true; # enable tap to click
        FirstClickThreshold = 1; # medium click threshold
        TrackpadRightClick = true; # enable two finger right click
        TrackpadThreeFingerDrag = true; # enable three finger drag
        TrackpadThreeFingerTapGesture = 0; # disable data detector
      };

      # turn off window margins
      WindowManager = {
        EnableTiledWindowMargins = false;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = false; # enable natural scrolling
        "com.apple.trackpad.trackpadCornerClickBehavior" = 1; # enable bottom right right-click
        "com.apple.trackpad.forceClick" = true; # enable force touch

        "com.apple.sound.beep.feedback" = 0; # disable beep sound when pressing volume up/down key
        AppleKeyboardUIMode = 3; # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true; # enable press and hold

        InitialKeyRepeat = 15; # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        KeyRepeat = 1; # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false; # disable auto capitalization
        NSAutomaticDashSubstitutionEnabled = false; # disable auto dash substitution
        NSAutomaticPeriodSubstitutionEnabled = false; # disable auto period substitution

        # expand save panel by default
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Create /etc/zshrc that loads the nix-darwin environment.
  # this is required if you want to use darwin's default shell - zsh
  programs.zsh.enable = true;
}
