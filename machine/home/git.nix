{
  lib,
  username,
  useremail,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  # https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "willsather"; # FIXME: update git username
    userEmail = "will@sather.ws"; # FIXME: update git email

    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };

    delta = {
      enable = true;
      options = {
        features = "side-by-side";
      };
    };

    aliases = {
      gst = "status";
      st = "status";

      di = "diff";
      co = "checkout";
      cm = "commit";
      cp = "cherry-pick";
      br = "branch";
      sta = "stash";

      ds = "diff --staged";
      fixup = "commit --fixup";
      squash = "commit --squash";

      amend = "commit --amend -m";
      amendit = "commit --amend --no-edit";

      llog = "log --date=local";
      flog = "log --pretty=fuller --decorate";
      lg = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      lol = "log --graph --decorate --oneline";
      lola = "log --graph --decorate --oneline --all";
      blog = "log origin/master... --left-right";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";

      unstage = "reset HEAD";
      rum = "rebase master@{u}";
    };
  };
}
