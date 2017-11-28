
alias cd-='cd -'
alias cd..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias ll='ls -l'
alias la='ls -la'
#alias make='colormake'
alias diff='colordiff'
#alias mount='mount |column -t'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm --preserve-root'

# confirmation #
#alias mv='mv -i'
#alias cp='cp -i'
#alias ln='ln -i'

alias tmuxnew='tmux new -s'
alias tmuxat='tmux a -t'
alias tmuxls='tmux ls'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias shutdown='sudo /sbin/shutdown'
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'

alias wget='wget -c'

alias df='df -H'
alias du='du -ch'
alias top='htop'

function vix {
   touch $1; chmod 751 $1; vi $1
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

