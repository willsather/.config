{pkgs, ...}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  #  NOTE: Your can find all available options in:
  #    https://daiderd.com/nix-darwin/manual/index.html
  #
  ##########################################################################

  # Install packages from nix's official package repository.
  #
  # Related Discussion: https://discourse.nixos.org/t/darwin-again/29331

  environment.systemPackages = with pkgs; [];

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # auto update applications
      cleanup = "uninstall"; # declaratively remove apps not present
    };

    taps = [
      "homebrew/services"

      # lazy
      # "jesseduffield/lazydocker"
      # "jesseduffield/lazygit"
    ];

    # `brew install`
    brews = [
      "bash"
      "vim"
      "gh"
      "jenv"

      # java
      "openjdk"
      "openjdk@21"
      "openjdk@17"
      "openjdk@11"

      # node
      "node"
      "node@20"
      "pnpm"

      # software
      "go"
      "python"
      "rust"
    ];

    # `brew install --cask`
    casks = [
      # productive
      "1password"
      "1password-cli"
      "bruno"
      "flycut"
      "raycast"
      "figma"
      "yaak"
      "notion"
      "topnotch"
      # "sourcetree"

      # lazy
      # "lazydocker"
      # "lazygit"

      # browsers
      "arc"
      "google-chrome"
      # "firefox"

      # vpn
      "mullvadvpn"

      # IDE
      "jetbrains-toolbox"
      "visual-studio-code"
      "cursor"

      # terminal emulators
      # "iterm2"
      "ghostty"

      # communication
      "slack"
      "zoom"

      # fonts
      "font-fontawesome"
      "font-geist"
      "font-geist-mono"
      "font-jetbrains-mono"
      "font-jetbrains-mono-nerd-font"
    ];
  };
}
