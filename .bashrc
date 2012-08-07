alias xamp='sudo /opt/lampp/lampp start; cd /opt/lampp/htdocs/.; clear;ls'
alias cdxamp='cd /opt/lampp/htdocs/.; clear;ls'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias r='rm *~;ls .'
alias gloobox="ssh gloobox@gloobox.info"

complete -cf sudo
eval "`dircolors -b`"
export HISTCONTROL=ignoredups
export set CLASSPATH=/usr/local/mysql-connector-java-5.1.18/mysql-connector-java-5.1.18-bin.jar:$CLASSPATH

PS1='\
\[\033[00m\][\
\[\033[35m\]\u\
\[\033[00m\]@\
\[\033[32m\]\h\
\[\033[00m\]:\
\[\033[34m\]\w\
\[\033[00m\]]\

\[\033[00m\][\
\[\033[32m\]\$\[\033[00m\]] '

export EDITOR="vim"
