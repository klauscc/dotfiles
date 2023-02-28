export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

export PATH=/Users/klaus/usr/local/bin:/Users/klaus/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

function rssh()
{
    host=$1
    port=$2
    ssh -N -f -L $port:localhost:$port $host
}


alias vim="nvim"
alias ls='ls -GFh'
alias ll="ls -l"
alias brevent="adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh"
alias ds="pmset displaysleepnow"

# alias for folders
alias paper='cd "$HOME/My Drive/deeplearning/papers"'
alias pro='cd "$HOME/My Drive/projects"'
alias gb='cd "$HOME/My Drive/timeline/PhD-with-gedas"'

alias briss='/Users/klaus/usr/local/Briss-2.0/bin/Briss-2.0'


alias sshcs="sshpass -f ~/.pwd ssh"

alias mnt_opr='sshfs -o password_stdin,reconnect,follow_symlinks,ServerAliveInterval=15,ServerAliveCountMax=3 fengchan@opr:/home/fengchan/ ~/mnt/opr <<< "Wscf931023&@"'
export PATH="/Library/TeX/texbin/":$PATH
# . "$HOME/.cargo/env"

# for project
export PYTHONPATH="/Users/klaus/My Drive/projects/video_understanding/temporal-action-detection/vedatad"
export PYTHONPATH="/Users/klaus/My Drive/projects/video_understanding/temporal-action-detection/SlowFast":$PYTHONPATH
# export PYTHONPATH="/Users/klaus/My Drive/projects/st-clip/singularity":$PYTHONPATH
export PYTHONPATH="/Users/klaus/My Drive/projects/vindlu/vindlu":$PYTHONPATH

