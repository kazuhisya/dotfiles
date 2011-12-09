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
export EDITOR=vim

# for fedora(Stable)
alias yumdownloader_src='yumdownloader --enablerepo=fedora-source,updates-source --source'
# for fedora(UnStable)
#alias yumdownloader_src='yumdownloader --enablerepo=fedora-source,updates-testing-source --source'
# for ScientificLinux with EPEL
#alias yumdownloader_src='yumdownloader --enablerepo=epel-source,sl-source --source'

# Normal User determine
# PS1 setting

# Loading git-completion
# for Fedora16
source /usr/share/doc/git-1.7.7.3/contrib/completion/git-completion.bash
# for RHEL6
#source /usr/share/doc/git-1.7.1/contrib/completion/git-completion.bash

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
            export PS1="\033k\033\\\\\033[36m\][\u@\h \W\$(__git_ps1)]$\[\033[0m\] "
        else
            # CLI + bash
            #export PS1="\[\033[36m\][\u@\h \W\$(__git_ps1)]\$\[\033[0m\] "
            export PS1="\[\033[36m\][\u@\h \[\033[0m\]\[\033[33m\]\W\[\033[0m\]\[\033[36m\]\$(__git_ps1)]$\[\033[0m\] "
        fi
    fi
    PATH="$PATH":${HOME}/.cabal/bin
else
    # root alias and PS1
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    export PS1="\[\033[31m\][\u@\h \W]#\[\033[0m\] "
fi

# less color hilite
export LESS='-R'
export LESSOPEN='| /usr/bin/src-hilite-lesspipe.sh %s'

# for cygwin setiings
#alias ls='ls --color'
#alias yum='/usr/bin/apt-cyg -u'
#source  /etc/bash_completion.d/git
#export PS1="\[\033[36m\][\u@\h \[\033[0m\]\[\033[33m\]\w\[\033[0m\]\[\033[36m\]\$(__git_ps1)]\[\033[0m\]\n$ "
#export TERM=xterm-color
#export PATH=$PATH:$HOME/bin
