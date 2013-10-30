# This theme is mostly yanked from the bira theme, with elements of crunch and 
# a few of my own tweaks to both. http://github.com/deanproxy
#ZSH_THEME_GIT_PROMPT_PREFIX=" %{$terminfo[bold]$fg[brgrey]%}("
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[grey32]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{239}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{239})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

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
local current_time=' %F{239}%T%{$reset_color%} '

# Sets up a nicer frame
typeset -A altchar
set -A altchar ${(s..)terminfo[acsc]}
PR_SET_CHARSET="%{$terminfo[enacs]%}"
PR_SHIFT_IN="%{$terminfo[smacs]%}"
PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
PR_HBAR=${altchar[q]:--}
PR_ULCORNER=${altchar[l]:--}
PR_LLCORNER=${altchar[m]:--}
PR_LRCORNER=${altchar[j]:--}
PR_URCORNER=${altchar[k]:--}

local top_left_corner="$PR_SHIFT_IN$PR_ULCORNER$PR_HBAR$PR_SHIFT_OUT"
local bottom_left_corner="$PR_SHIFT_IN$PR_LLCORNER$PR_HBAR$PR_SHIFT_OUT"

# PROMPT="${top_left_corner}${user_host}%{$reset_color%}:${current_dir}${git_branch}
# ${bottom_left_corner}${current_time}%# "
PROMPT="${user_host}:${current_dir}${git_branch}${current_time}%#> "
RPS1="${return_code}"""
