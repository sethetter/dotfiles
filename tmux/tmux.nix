{ pkgs }:
{
    enable = true;
    prefix = "C-a";
    terminal = "xterm-256color";
    extraConfig = (builtins.readFile ./tmux.conf);
    plugins = with pkgs.tmuxPlugins; [
      tmux-colors-solarized
      copycat
      sensible
      tmux-fzf
      fzf-tmux-url
      sessionist
    ];
  }
