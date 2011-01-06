# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias la='ls -la'
alias wget='wget -c'


# PS1 setting
if [ "$GDMSESSION" = "gnome" ];then
  # Gnome On
  if [ $SHLVL = 3 ];then
    # Gnome + screen
    export PS1='\033k\033\\\[\033[36m\][\u@\h \W]$\[\033[0m\] '
  else
    # Gnome + bash
    export PS1="\[\033[36m\][\u@\h \W]\$\[\033[0m\] "
  fi
else
  # Gnome Off
  if [ $SHLVL = 2 ];then
    # CLI + screen
    export PS1='\033k\033\\\[\033[36m\][\u@\h \W]$\[\033[0m\] '
  else
    # CLI + bash
    export PS1="\[\033[36m\][\u@\h \W]\$\[\033[0m\] "
  fi
fi
