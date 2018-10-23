
alias cd-='cd -'
alias cd..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias ls='ls --color=auto'
alias ll='ls -alhF'
alias la='ls -lA'
#alias make='colormake'
alias diff='colordiff'
#alias mount='mount |column -t'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm --preserve-root'
alias mkdir='mkdir -p'

# confirmation #
#alias mv='mv -i'
#alias cp='cp -i'
#alias ln='ln -i'

# Tmux
alias tmn='tmux new -s'
alias tma='tmux a -t'
alias tm='tmux'

alias wget='wget -c'

# Parenting changing perms on / #
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# octal+text permissions for files
alias perms="stat -c '%A %a %n'"

alias shutdown='sudo /sbin/shutdown'
alias reboot='sudo /sbin/reboot'
alias halt='sudo /sbin/halt'

alias df='df -H'
alias du='du -ch'
alias top='htop'

alias sudo='sudo '

function vix {
   touch $1; chmod 751 $1; vi $1
}

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias xip='cd ~/work/projects/xip3901uc'
alias cpu3='cd ~/work/projects/cpueth3'
