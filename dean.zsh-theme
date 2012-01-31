ZSH_THEME_GIT_PROMPT_PREFIX="%{$terminfo[bold]$fg[yellow]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$terminfo[bold]$fg[yellow]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$terminfo[bold]$fg[green]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$terminfo[bold]$fg[red]%}✗"

local return_code="%(?..%{$fg[red]%}%? ?~F?%{$reset_color%})"

local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%} %~%{$reset_color%}'
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─${user_host} ${current_dir} ${rvm_ruby} ${git_branch}
╰─%B$%b "
RPS1="${return_code}""")"
