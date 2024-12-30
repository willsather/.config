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
      export PATH=$PATH:$HOME/go/bin
      export PATH=$PATH:$HOME/.cargo/bin
      export PATH=$PATH:$HOME/.sst/bin

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
