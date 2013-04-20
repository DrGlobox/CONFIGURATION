#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#
 
# Complétion 
autoload -U compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                             /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh_cache
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ''
zstyle ':competion:*' list-prompt
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' file-sort type
zmodload zsh/complist
setopt extendedglob
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"
setopt BANG_HIST
unsetopt LIST_AMBIGUOUS

zstyle ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select

#only *.java for javac
zstyle ':completion:*:javac:*' files '*.java'

# Fait la complétion sur les fichiers et répertoires cachés
setopt glob_dots

#complete in words
setopt complete_in_word

# Traite les liens symboliques comme il faut
setopt CHASE_LINKS

 
# Correction des commandes
setopt correctall
 
# Un petit prompt sympa
autoload -U promptinit
promptinit
prompt adam2
 
# Les alias marchent comme sous bash
alias ls='ls --color=auto'
alias ll='ls --color=auto -lha'
alias mplayerfb='mplayer -vo fbdev -vf scale=1024:768'
export GREP_COLOR=31
alias grep='grep --color=auto'
alias RUNSEVER='python2 manage.py runserver 8080'

# un VRAI éditeur de texte ;)
export EDITOR=/usr/bin/vim

export PATH=$PATH:/usr/lib
export PATH=$PATH:/usr/lib/swipl-6.2.6/include/

# Touche de commande
bindkey "OH" beginning-of-line # Début
bindkey "OF" end-of-line # Fin
bindkey "[3~" delete-char
bindkey "" history-incremental-search-backward # Rechercher

# Jamais de BEEP
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# ask confirmation for rm *
setopt RM_STAR_WAIT
setopt NO_RM_STAR_SILENT

