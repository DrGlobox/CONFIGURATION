#!/usr/bin/env zsh
#   _________  _   _ ____   ____ 
#  |__  / ___|| | | |  _ \ / ___|
#    / /\___ \| |_| | |_) | |    
# _ / /_ ___) |  _  |  _ <| |___ 
#(_)____|____/|_| |_|_| \_\\____|
#


#==================== My Prompt =================================#
local curdir="%d"
local hostname="%M"
local username="%n"
local colorfg="%F"
local uncolorfg="%f"
local mytime="%*"
local return_status="%?"
source /home/locatelli/.zsh/zsh-git-prompt/zshrc.sh
FPATH=~/.zsh/zsh-git-prompt/:$FPATH
autoload -Uz zshrc.sh

PROMPT="╔══\$(git_super_status)══╡$colorfg{blue}$curdir${uncolorfg}
╚═╡$username$colorfg{red}:${uncolorfg}$hostname $colorfg{green}♪$uncolorfg "
RPROMPT="$mytime"


#==================== History =====================================#
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
HISTFILE=~/.zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export HISTFILE HISTSIZE SAVEHIST
setopt histverify



#==================== Alias =====================================#
alias zshrc="source ~/.zshrc"
alias ls='ls --color=auto'
alias ll='ls --color=auto -lha'
alias l='ls --color=auto'
alias grep='grep --color=auto'

#==================== Auto complet ==============================#

setopt globdots         # Match all files beginning by . be autocomplet
setopt complete_in_word # Auto complet in word
setopt CORRECT          # Correction of command name
setopt NO_CASE_GLOB     # Case insensitive
setopt NUMERIC_GLOB_SORT # Sort by Number
setopt EXTENDED_GLOB
unsetopt LIST_AMBIGUOUS

#==================== ZStyle autocomplet ==============================#

autoload -U zutil
autoload -U compinit
autoload -U complist
compinit

# Global completion behavior
zstyle ':completion:*' completer _complete _prefix _approximate
zstyle ':completion:*:complete:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' use-ip true

# Use 'ps -au$USER' for fetch user process list
zstyle ':completion:*:processes' command 'ps -au$USER'

zstyle ':completion:*' ignore-parents parent pwd

# few simple completion definitions
compdef _hosts mtr
compdef _hosts rdesktop
compdef _gnu_generic sort

# Some zstyle specific to vi/vim
zstyle ':completion:*:*:vi*:*' file-sort modification
zstyle ':completion:*:*:vi*:*' ignored-patterns '*.(o|class)'

# Message
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

# Cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Kill
zstyle ':completion:*:kill:*' command 'ps xf -u $USER -o pid,%cpu,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select

# Options
setopt correct
setopt always_to_end

zstyle ':completion:*' completer _expand _complete _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*:approximate:*' max-errors par 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'


#==================== Divers ==============================#
setopt NO_BEEP             # Never Beep
setopt RM_STAR_WAIT        # Wait 10sec after rm *
setopt NO_RM_STAR_SILENT
export EDITOR=/usr/bin/vim
setopt CHASE_LINKS         # GO to the true value of a relative link

source /etc/zsh_command_not_found

