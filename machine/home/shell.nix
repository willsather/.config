{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      ll = "ls -l";
      lsa = "ls -la";

      pn = "pnpm";
      lzd = "lazydocker";
      kp = "killport";
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["git"];
      theme = "robbyrussell";
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
    ];

    initExtra = ''
      # override git indicator
      # ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$reset_color%} ▲"
      # ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})%{$reset_color%} ▲"

      # brew
      export PATH="/opt/homebrew/bin:$PATH"

      # pnpm
      export PNPM_HOME="$HOME/.local/share/pnpm"
      export PATH="$PNPM_HOME:$PATH"

      # go
      export PATH="$HOME/go/bin:$PATH"

      # other
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$HOME/.sst/bin:$PATH"

      # jenv setup
      export PATH="$HOME/.jenv/bin:$PATH"
      eval "$(jenv init -)"

      # killport function
      killport() {
        for port in "$@"; do
          lsof -ti:$port | xargs kill -9
        done
      }
    '';
  };

  home.shellAliases = {
    k = "kubectl";
  };
}
