# This theme is mostly yanked from the bira theme, with elements of crunch and 
# a few of my own tweaks to both. http://github.com/deanproxy
ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[yellow]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$terminfo[bold]$fg[yellow]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$terminfo[bold]$fg[green]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$terminfo[bold]$fg[red]%}✗"

case $TERM in
    xterm*)
        titlebar=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ - %y\a%}'
        ;;
    screen)
        titlebar=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ - %y\e\\%}'
        ;;
    *)
        titlebar=''
        ;;
esac

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

local user_host='%{$titlebar%}%{$terminfo[bold]$fg[green]%}%(!.%SROOT%s.%n)@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'
local current_time='(%{$terminfo[bold]$fg[yellow]%}%T%{$reset_color%})'

PROMPT="╭─${user_host}%{$reset_color%}:${current_dir} ${git_branch}
╰─${current_time}%# "
RPS1="${return_code}"""
