alias ll="ls -la"
set -o vi
bind -m vi-command L:end-of-line
bind -m vi-command H:vi-first-print
export EDITOR=vi

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function stylePrompt {
    local BLUE="\[\033[0;34m\]"
    local RED="\[\033[0;31m\]"
    local GREEN="\[\033[0;32m\]"
    case $TERM in
        xterm*)
        TITLEBAR="\[\033]0;\u@h:\w\007\]"
        ;;
        *)
        TITLEBAR=""
        ;;
    esac

PS1="[👁 ][:\w ]$ "
PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H:%M)$BLUE]\
$BLUE[👁 ]\
$BLUE[$RED:\w$GREEN\$(parse_git_branch)$BLUE]\
$GREEN\$ "
}
stylePrompt
