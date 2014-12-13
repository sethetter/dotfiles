# ZSH Theme - Preview: http://gyazo.com/8becc8a7ed5ab54a0262a470555c3eed.png
# Customized to remove the host info
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$fg[green]%}%n%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
#local rvm_ruby=''
#if which rvm-prompt &> /dev/null; then
#  rvm_ruby='%{$fg[blue]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
#else
#  if which rbenv &> /dev/null; then
#    rvm_ruby='%{$fg[blue]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
#  fi
#fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host}${current_dir} ${git_branch}
╰─%B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[magenta]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
