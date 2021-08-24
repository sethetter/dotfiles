{ pkgs }:
{
  enable = true;
  prefix = "C-a";
  baseIndex = 1;
  terminal = "xterm-256color";
  extraConfig = (builtins.readFile ./tmux.conf);
  plugins = with pkgs.tmuxPlugins; [
    {
      plugin = tmux-colors-solarized;
      extraConfig = ''
        set-option -ga terminal-overrides ",xterm-256color:Tc"
        set -g @colors-solarized 'light'
      '';
    }
    copycat
    sensible
    tmux-fzf
    fzf-tmux-url
    sessionist
  ];
}
