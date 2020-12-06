# PROMPT
# http://ezprompt.net
export PS1="\[\e[34m\]\u\[\e[m\]@\h \[\e[32m\]\w\[\e[m\] \\$ "

# ALIAS
export EXA_COLORS="da=1;31"
alias ll='exa -lah'

# HISTORY
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

function load {
    xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorscreen/workspace0/last-image -s $1
}
load /usr/share/backgrounds/linux/bg-kernel.png
