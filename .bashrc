# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias la='ls -la'
alias wget='wget -c'

export PS1="\[\033[36m\][\u@\h \W]\$\[\033[0m\] "

# screen setting
# export PS1='\033k\033\\\[\033[36m\][\u@\h \W]$\[\033[0m\] '

