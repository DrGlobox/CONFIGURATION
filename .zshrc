# /etc/zsh/zshrc ou ~/.zshrc
# Fichier de configuration principal de zsh
# Fichier initial par Alexis de Lattre
# Modifié par Romain BOISSAT
# Modifié par Julien VOISIN

#Alias
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias r='rm *~;ls .'
alias betilla="ssh locatelli@178.170.101.100"
alias gate="ssh plocatel@gate-info.iut-bm.univ-fcomte.fr"


#hosts
if [ -f ~/.hosts ]; then
source ~/.hosts
fi
#
# KEYMAP
#
bindkey '^A' beginning-of-line # Home
bindkey '^E' end-of-line # End
bindkey '^D' delete-char # Del
bindkey '^W' delete-word # Del
bindkey '[3~' delete-char # Del
bindkey '[2~' overwrite-mode # Insert
bindkey '[5~' history-search-backward # PgUp
bindkey '[6~' history-search-forward # PgDn

#
# PROMPT
#

#autoload -Uz vcs_info

if [ "`id -u`" -eq 0 ]; then
export PS1="%{[33;36;1m%}%T%{[0m%} %{[33;34;1m%}%n%{[0m[33;33;1m%}@%{[33;37;1m%}%m %{[33;32;1m%}%~%{[0m[33;33;1m%}%#%{[0m%} "
  export HISTFILE=/root/.history
else
export PS1="%T%{[0m%} %{[33;35;1m%}%n%{[0m[33;32;3m%}@%M %{[33;36;1m%}%~%{[0m[33;39;1m%}
%#%{[0m%} "
  export HISTFILE=$HOME/.history
fi

# Console linux, dans un screen ou un rxvt
if [ "$TERM" = "linux" -o "$TERM" = "screen" ]
then
  # Correspondance touches-fonction spécifique
  bindkey '[1~' beginning-of-line # Home
  bindkey '[4~' end-of-line # End
fi

# xterm
if [ "$TERM" = "xterm" ]
then
  # Correspondance touches-fonction spécifique
  bindkey '[H' beginning-of-line # Home
  bindkey '[F' end-of-line # End
fi

# Gestion de la couleur pour 'ls' (exportation de LS_COLORS)
if [ -x /usr/bin/dircolors ]
then
eval "`dircolors`"
fi

#____________________________________________________________________________
#
# 3. Options de zsh (cf 'man zshoptions')
#

setopt zle

# Je ne veux JAMAIS de beeps
unsetopt BEEP
unsetopt HIST_BEEP
unsetopt LIST_BEEP

# >| doit être utilisés pour pouvoir écraser un fichier déjà existant ;
# le fichier ne sera pas écrasé avec '>'
unsetopt CLOBBER

# Affiche le code de sortie si différent de '0'
setopt PRINT_EXIT_VALUE

# ask confirmation for rm *
setopt RM_STAR_WAIT
setopt NO_RM_STAR_SILENT

# spellcheck commands
setopt CORRECT

#
# Completion
#

#zstyle ':completion:*' verbose yes

autoload -U compinit
compinit

#expand aliases
setopt aliases

#! expansion
setopt BANG_HIST

#nice completion
unsetopt LIST_AMBIGUOUS

#verboses function
zstyle ':completion:*' verbose yes

#color
zstyle ':completion:*' list-colors ''

#one tab : list, 2tab, compelte first occurence
zstyle ':competion:*' list-prompt

# pretty kill completion. colored, cpu load & process tree
zstyle ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select

#case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 3 numeric

#new style completion !
zstyle ':completion:*' use-compctl false

#order
zstyle ':completion:*' file-sort type

#use cache (apt and dpkg are sooooo slow)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

#warning : command not found :/ (buggy)
#zstyle ':completion:*:warnings' format 'NO SOUP FOR %d'

#fuzzy matching
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only
#zstyle ':completion:*:approximate:*' max-error 1 numeric

#if you end up using a directory as argument, this will remove th trailling slash
zstyle ':completion:*' squeeze-slashes true

#smoooth rm : no dups on completion
zstyle ':completion:*:rm:*' ignore-line yes

#only *.java for javac
zstyle ':completion:*:javac:*' files '*.java'

# Fait la complétion sur les fichiers et répertoires cachés
setopt glob_dots

#complete in words
setopt complete_in_word

#expand globs
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# Traite les liens symboliques comme il faut
setopt CHASE_LINKS


# Quand l'utilisateur commence sa commande par '!' pour faire de la
# complétion historique, il n'exécute pas la commande immédiatement
# mais il écrit la commande dans le prompt

# why would you type 'cd dir' if you could just type 'dir' ?
setopt AUTO_CD

# L'exécution de "cd" met le répertoire d'où l'on vient sur la pile
setopt AUTO_PUSHD

# Ignore les doublons dans la pile
setopt PUSHD_IGNORE_DUPS

# N'affiche pas la pile après un "pushd" ou "popd"
setopt PUSHD_SILENT

# "pushd" sans argument = "pushd $HOME"
setopt PUSHD_TO_HOME

# Les jobs qui tournent en tâche de fond sont nicés à '0'
unsetopt BG_NICE

# N'envoie pas de "HUP" aux jobs qui tourent quand le shell se ferme
unsetopt HUP

#---------------------------------------------------------------------------
# HISTORY
#

#how many lines to save
export HISTORY=1024
export SAVEHIST=1024

#do not remember noise
export HISTIGNORE="&:ls:exit:clear"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

#append and not delete
setopt APPEND_HISTORY

#when "!" for history completion, desplay commande before execution
setopt HIST_VERIFY

#share history between sessions
setopt SHARE_HISTORY

#----------------------------------------------------------------------------
# MISC
#

#say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

#watch other user login/out
watch=(notme)
LOGCHECK=60
WATCHFMT="[%B%t%b] %B%n%b has %a %B%l%b from %B%M%b"

#____________________________________________________________________________
#
# 6. Exports
#
# sinon fr_FR.UTF-8

export LESS_TERMCAP_mb=$'\E[01;31m' # début de blink
export LESS_TERMCAP_md=$'\E[01;31m' # début de gras
export LESS_TERMCAP_me=$'\E[0m' # fin
export LESS_TERMCAP_so=$'\E[01;44;33m' # début de la ligne d`état
export LESS_TERMCAP_se=$'\E[0m' # fin
export LESS_TERMCAP_us=$'\E[01;32m' # début de souligné
export LESS_TERMCAP_ue=$'\E[0m' # fin

export TERM="xterm-256color"

export EDITOR="vim"
export LANG="fr_FR.UTF-8"
#export LANG="en_US.UTF-8"
export LC_ALL="fr_FR.UTF-8"
#export LC_ALL="en_US.UTF-8"
export PATH=/opt/bin:/sbin:/usr/sbin:/:.:$PATH
export GREP_COLOR=7 #matches in invert color
