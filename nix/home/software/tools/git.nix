{ config, lib, pkgs, ... }:

# TODO: migrate to DELTA-GIT
{
  programs.git = {
    enable = true;
    aliases = {
      f = "fetch";
      a = "!git status --short | fzf | awk '{print $2}' | xargs git add";
      d = "diff";
      l = "!git log --graph --oneline --decorate --parents";
      ds = "diff --staged";
      co = "checkout";
      ci = "commit";
      ca = "commit -a";
      ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
      pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
      st = "status";
      br = "branch";
      ba = "branch -a";
      bm = "branch --merged";
      bn = "branch --no-merged";
      df = "!git hist | fzf | awk '{print $2}' | xargs -I {} git diff {}^ {}";
      hist = "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all";
      llog = "log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative";
      open = "!hub browse";
      type = "cat-file -t";
      dump = "cat-file -p";
      find = "!f() { git log --pretty=format:\"%h %cd [%cn] %s%d\" --date=relative -S'pretty' -S\"$@\" | fzf | awk '{print $1}' | xargs -I {} git diff {}^ {}; }; f";
      edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; vim `f`";
      add-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; git add `f`";
    };
    userName = "rafaeloledo";
    userEmail = "rafaeloliveiraledo@gmail.com";
    extraConfig = {
      push = {
        default = "simple";
      };
      color = {
        status = "auto";
        diff = "auto";
        branch = "auto";
        interactive = "auto";
        grep = "auto";
        ui = "auto";
      };
      hub = {
        protocol = "https";
      };
      github = {
        user = "rafaeloledo";
      };
      diff = {
        tool = "nvimdiff";
      };
      ghq = {
        root = "~/.ghq";
      };
      core = {
       autocrlf = "false";
      };
      init = {
        defaultBranch = "main";
      };
      "difftool \"nvimdiff\"" = {
        cmd = "nvim -d \"$LOCAL\" \"$REMOTE\"";
      };
      "mergetool \"nvimdiff\"" = {
        cmd = "nvim -d \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"";
        trustExitCode = "true";
      };
      "filter \"lfs\"" = {
        clean = "git-lfs clean -- %f";
        smudge = "git-lfs smudge -- %f";
        required = "true";
        process = "git-lfs filter-process";
      };
    };
  };
}
