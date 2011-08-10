# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias la='ls -la'
alias wget='wget -c'
alias grep='grep --color'
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
if [[ ${EUID} -ne 0 ]] ; then
    if [ "$GDMSESSION" = "gnome" ];then
        #  # Gnome On
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
    PATH="$PATH":${HOME}/.cabal/bin
else
    # root alias and PS1
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    export PS1="\[\033[31m\][\u@\h \W]\$\[\033[0m\] "
fi
