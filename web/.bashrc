# splash screen
echo -e "\n$(neofetch)"

# PROMPT
# http://ezprompt.net
export PS1="\[\e[34m\]\u\[\e[m\]@\h \[\e[32m\]\w\[\e[m\] \\$ "

# ALIAS
export EXA_COLORS="da=1;31"
alias ll='exa -lah'
# https://unix.stackexchange.com/questions/159253/decoding-url-encoding-percent-encoding
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'

# HISTORY
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

# example: "change_background /usr/share/backgrounds/xfce/xfce-blue.png"
function change_background {
  local BACKGROUND_PATH=${1:?"Invalid BACKGROUND_PATH"}
  xfconf-query -c xfce4-desktop -p /backdrop/screen0/monitorscreen/workspace0/last-image -s $BACKGROUND_PATH
}

# GOLANG
export PATH="$(go env GOPATH)/bin:$PATH"
