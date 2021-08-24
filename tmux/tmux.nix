{ pkgs }:
{
  enable = true;
  prefix = "C-a";
  terminal = "xterm-256color";
  extraConfig = (builtins.readFile ./tmux.conf);
  plugins = with pkgs.tmuxPlugins; [
    {
      plugin = tmux-colors-solarized;
      extraConfig = "set -g @colors-solarized 'light'";
    }
    copycat
    sensible
    tmux-fzf
    fzf-tmux-url
    sessionist
  ];
}
