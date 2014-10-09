export PATH=node_modules/.bin:/usr/local/bin:$PATH

export EDITOR=vi
export GREP_COLORS=1
export CLICOLOR=1
export WORKON_HOME=~/.virtualenvs
export REPOS=~/.gitrepos

alias ls='ls -la'

autoload colors
colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' check-for-changes true
precmd() {
    vcs_info
}

zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}"
zstyle ':vcs_info:git*' formats "%{$fg[green]%}%u%b%{$reset_color%} "

# colored completion - use my LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt prompt_subst
PROMPT=$'%{$fg[cyan]%}%1~ %{$reset_color%} %{\e[0m%}${vcs_info_msg_0_}$ '
RPROMPT=$'[%{$fg[cyan]%}%*%{$reset_color%}]'

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
bindkey -e
