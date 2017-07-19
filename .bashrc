# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias la='ls -la'
alias wget='wget -c'
alias grep='grep --color=always'
alias date='LANG=en date'
alias dnf='sudo dnf'
alias yum='sudo dnf'
alias systemctl='sudo systemctl'
export EDITOR=vim

# Loading git-completion
source /usr/share/git-core/contrib/completion/git-prompt.sh

# Normal User determine
# PS1 setting
if [[ ${EUID} -ne 0 ]] ; then
    if [ "$GDMSESSION" = "gnome" ];then
        #  # Gnome On
        if [ $SHLVL = 3 ];then
            # Gnome + screen
            export PS1="\033k\033\\\\\033[36m\][\u@\h \W\$(__git_ps1)]$\[\033[0m\] "
        else
            # Gnome + bash
            # export PS1="\[\033[36m\][\u@\h \W\$(__git_ps1)]\$\[\033[0m\] "
            export PS1="\[\033[36m\][\u@\h \[\033[0m\]\[\033[33m\]\W\[\033[0m\]\[\033[36m\]\$(__git_ps1)]$\[\033[0m\] "
        fi
    else
        # Gnome Off
        if [ $SHLVL = 2 ];then
            # CLI + screen
            #export PS1="\033k\033\\\\\033[36m\][\u@\h \W\$(__git_ps1)]$\[\033[0m\] "
            export PS1="\[\033[36m\][\u@\h \[\033[0m\]\[\033[33m\]\W\[\033[0m\]\[\033[36m\]\$(__git_ps1)]$\[\033[0m\] "
        else
            # CLI + bash
            #export PS1="\[\033[36m\][\u@\h \W\$(__git_ps1)]\$\[\033[0m\] "
            export PS1="\[\033[36m\][\u@\h \[\033[0m\]\[\033[33m\]\W\[\033[0m\]\[\033[36m\]\$(__git_ps1)]$\[\033[0m\] "
        fi
    fi
else
    # root alias and PS1
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    export PS1="\[\033[31m\][\u@\h \W]#\[\033[0m\] "
fi

alias cutemarked=LANG='ja_JP.utf-8 cutemarked'
export LANG=ja_JP.utf-8
export GDM_LANG=ja_JP.utf-8

if [ "$TERM" = "xterm-256color" ] ; then
  export LANG=en_US.utf-8
fi

#alias docker='sudo docker'
alias chown='sudo chown'
alias git-clean-branch='git fetch --prune $1 $(git fetch -p $1)'

