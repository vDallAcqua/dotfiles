#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Funzione per cambiare colore al $ se c'è errore
prompt_command() {
    if [ $? -eq 0 ]; then
        PS1_SYMBOL="\[\e[1;32m\]\$" # Verde se OK
    else
        PS1_SYMBOL="\[\e[1;31m\]\$" # Rosso se Errore
    fi
}
PROMPT_COMMAND=prompt_command()


# LF Icons
export LF_ICONS=$(cat ~/.config/lf/icons)

