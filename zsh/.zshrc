# ufetch

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
setopt nolistbeep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/aksel/.zshrc'
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
# End of lines added by compinstall

# Vim keys
bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Block/Line cursor
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Prompt
autoload -Uz promptinit
promptinit

PROMPT="%~ %B%F{red}>%f%b "

export PATH="/bin/:/usr/bin/:/home/aksel/.cargo/bin:/home/aksel/.local/bin"
eval "$(zoxide init zsh)"

# Aliases
alias p3="python3"
alias ls="ls --color=auto"
alias grep='grep --color=auto -ni'
alias zat='devour zathura'
alias l='tree'
alias cd='z'
alias r='ranger'
alias feh='devour feh --zoom max --scale-down --image-bg black'
alias code='code --enable-proposed-api ms-python.python,ms-toolsai.jupyter'

# autoload -Uz vcs_info
# precmd_vcs_info() { vcs_info }
# precmd_functions+=( precmd_vcs_info )
# setopt prompt_subst
# RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
# zstyle ':vcs_info:git:*' formats '%b'
