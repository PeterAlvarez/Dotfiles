#
# ~/.bashrc

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/local/bin

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  # We have color support; assume it's compliant with Ecma-48
  # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
  # a case would tend to support setf rather than setaf.)
  color_prompt=yes
    else
  color_prompt=
    fi
fi


#===agreando date

date_color='\e[0;32m'
time_color='\e[0;33m'
batery_color='\e[1;34m'

function __year() {
    printf "`date +%Y`"
}
function __month() {
    printf "`date +%m`"
}
function __day() {
    printf "`date +%d`"
}
function __hour() {
    printf "`date +%H`"
}
function __minute() {
    printf "`date +%M`"
}
function __second() {
    printf "`date +%S`"
}

TIME_PS1="\
\[$off\][ \
\[$date_color\]\$(__year)\
\[$off\]-\
\[$date_color\]\$(__month)\
\[$off\]-\
\[$date_color\]\$(__day)\
\[$off\] \
\[$time_color\]\$(__hour)\
\[$off\]:\
\[$time_color\]\$(__minute)\
\[$off\]:\
\[$time_color\]\$(__second)\
\[$off\]\e[1;31m ]─"



function __batery() {
    if [ `acpi | awk '{print $3}' | cut -c 1` = "C" ]; then
        printf "+ `acpi | awk '{print $4-0}'`"
        # printf "`acpi | awk '{print $3}' +` `acpi | awk '{print $4-0}'`"
    else
        printf "`acpi | awk '{print $4-0}'`"
    fi
}


BATERY="\
\[$off\]\e[1;31m[ \
\[$batery_color\]\$(__batery)\
\[$off\]%\e[1;31m ]─"

# [\[\033[0;32m\]== [
#e[1;31m[ ==[
#e[1;31m] ==]
if [ "$color_prompt" = yes ]; then
    PS1="\[\033[0;31m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;39m\]\u\[\033[01;33m\]@\[\033[01;96m\]\h'; fi)\[\033[0;31m\]]\342\224\200[\[\033[0;32m\]\w\[\033[0;31m\]]\n\[\033[0;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
else
    PS1='┌──[\u@\h]─[\w]\n└──╼ \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\033[1;31m\]\342\224\214\342\224\200${BATERY}${TIME_PS1}\e[1;31m[ $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]root\[\033[01;33m\]@\[\033[01;96m\]\h'; else echo '\[\033[0;36m\]\u\[\033[1;31m\] => \[\033[0;34m\]\h '; fi)\[\033[1;31m\]]\342\224\200[\[\033[0;32m\] \w \[\033[1;31m\]]( \$(git branch 2>/dev/null | grep '^*' | colrm 1 2) )\n\[\033[1;31m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]\[\e[01;33m\]\\$\[\e[0m\]"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi



# screenshots
#timestamp="$(date +%Y%m%d%H%M%S)"
#targetbase="$HOME/screenshots"
#mkdir -p $targetbase
#[ -d $targetbase ] || exit 1
#scrot $targetbase/$timestamp.png


# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias em='emacs -nw'
alias _='sudo'
alias pyServer='python -m http.server'
alias entrada='~/.input'
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ===== History Configurations =====
HISTSIZE=8192
HISTFILESIZE=16384
HISTCONTROL=ignoredups # ignorespace | ignoreboth
HISTTIMEFORMAT="%D - %T : "
shopt -s histappend
shopt -s checkwinsize


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
neofetch

echo -e "        \e[1;34m╔════════════════════╗         ╔════════════════════════════╗\e[0m"
echo -e "        \e[1;34m║....................║         ║.╔╗.........................║\e[0m"
echo -e "        \e[1;34m║.╔══╗...............║         ║.║║.................╔╗..╔╦╗.║\e[0m"
echo -e "        \e[1;34m║.╚╣╠╬╗╔╦╦╗..╔═╦═╦═╗.║         ║.║║..╔═╦══╗..╔═╦═╦═╦╣╠╗.║║║.║\e[0m"
echo -e "        \e[1;34m║..║║║╚╝╠.╣..║║║╠╣║║.║         ║.║║..╠╝║║║║..║╠╣║║║╠╗╔╣.╠╬╣.║\e[0m"
echo -e "        \e[1;34m║..╚╝╚══╩╩╝..║╔╩╝╚═╝.║         ║.╚╝..╚═╩╩╩╝..╚╝╚═╩═╝╚═╝.╚╩╝.║\e[0m"
echo -e "        \e[1;34m╚════════════╩╩══════╝         ╚════════════════════════════╝\e[0m"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

alias luamake=/home/tux/lua-language-server/3rd/luamake/luamake

neofetch
neofetch
