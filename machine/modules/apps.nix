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
      "openjdk@23"
      "openjdk@21"
      "openjdk@17"
      "openjdk@11"

      # node
      "node@22"
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
      "rectangle"
      # "sourcetree"

      # lazy
      # "lazydocker"
      # "lazygit"

      # browsers
      "arc"
      # "firefox"
      # "google-chrome"
      # "zen-browser"

      # IDE
      "jetbrains-toolbox"

      # terminal
      "iterm2"
      # "ghostty"

      "visual-studio-code"
      "zed"

      # communiction
       "slack"
      # "zoom"

      # fonts
      "font-fontawesome"
      "font-geist"
      "font-geist-mono"
      "font-jetbrains-mono"
      "font-jetbrains-mono-nerd-font"
    ];
  };
}
