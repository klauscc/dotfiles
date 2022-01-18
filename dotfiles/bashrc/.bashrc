export PATH=/Users/klaus/usr/local/bin:/Users/klaus/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/klaus/usr/local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/klaus/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/klaus/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/klaus/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function rssh()
{
    host=$1
    port=$2
    ssh -N -f -L $port:localhost:$port $host
}

export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

alias vim="nvim"
alias ls='ls -GFh'
alias ll="ls -l"
alias brevent="adb -d shell sh /data/data/me.piebridge.brevent/brevent.sh"

# alias for folders
alias paper='cd "$HOME/My Drive/deeplearning/papers"'
alias sem5='cd "$HOME/My Drive/timeline/20210813-20220112UNC-5semester"'
alias pro='cd "$HOME/My Drive/projects"'

alias briss='java -jar ~/Applications/briss-0.9/briss-0.9.jar'


alias sshcs="sshpass -p 'pwd' ssh"

conda activate torch-1.9.0

# for project
export PYTHONPATH="/Users/klaus/My Drive/projects/video_understanding/temporal-action-detection/vedatad"
