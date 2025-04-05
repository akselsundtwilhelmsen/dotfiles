HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=2000
unsetopt beep
setopt append_history
setopt inc_append_history
setopt nolistbeep
bindkey -v

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
alias l='tree -h -a'
alias l1='tree -h -a -L 1'
alias l2='tree -h -a -L 2'
alias l3='tree -h -a -L 3'
alias l4='tree -h -a -L 4'
alias l5='tree -h -a -L 5'
alias l6='tree -h -a -L 6'
alias cd='z'
alias r='ranger'
alias feh='devour feh --zoom max --scale-down --image-bg black'
alias code='code --enable-proposed-api ms-python.python,ms-toolsai.jupyter'
alias nvim='~/scripts/nvim.sh'
alias pacman='~/scripts/pacman.sh'
alias cb='xclip -selection c'
alias space='du -ah | sort -h'
alias vpnhome='sudo wg-quick down /etc/wireguard/aksel-laptop.conf && sudo wg-quick up /etc/wireguard/aksel-laptop.conf'
alias todo='nvim ~/uni/todo'
alias cat='bat'
alias paclist='expac -H M "%011m\t%-20n\t%10d" $(pacman -Qq) | sort -n'

# git info 
setopt prompt_subst
autoload -Uz vcs_info
zstyle ":vcs_info:*" actionformats "%F{orange}[%b|%a]%f "
zstyle ":vcs_info:*" formats "%F{#555555}[%b]%f "
zstyle ":vcs_info:(sv[nk]|bzr):*" branchformat "%F{yellow}%b:%r%f"
zstyle ":vcs_info:*" enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# applications
export IMAGE_VIEWER="feh --zoom max --scale-down --image-bg black"
