export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

export PATH=/Applications/WezTerm.app/Contents/MacOS:$PATH

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
alias pro='cd "$HOME/Documents/projects"'
alias prog='cd "$HOME/Google Drive/My Drive/projects"'
alias note='cd "$HOME/My Drive/notes"'
alias gb='cd "$HOME/My Drive/timeline/PhD-with-gedas"'

alias briss='/Users/klaus/usr/local/Briss-2.0/bin/Briss-2.0'


alias sshcs="sshpass -f ~/.pwd ssh"

alias mnt_opr='sshfs -o password_stdin,reconnect,follow_symlinks,ServerAliveInterval=15,ServerAliveCountMax=3 fengchan@opr:/home/fengchan/ ~/mnt/opr <<< "Wscf931023&@"'
export PATH="/Library/TeX/texbin/":$PATH

# for project
export PYTHONPATH="/Users/klaus/My Drive/projects/video_understanding/temporal-action-detection/vedatad"
export PYTHONPATH="/Users/klaus/My Drive/projects/video_understanding/temporal-action-detection/SlowFast":$PYTHONPATH
# export PYTHONPATH="/Users/klaus/My Drive/projects/st-clip/singularity":$PYTHONPATH
export PYTHONPATH="/Users/klaus/My Drive/projects/vindlu/vindlu":$PYTHONPATH
export PYTHONPATH="/Users/klaus/My Drive/projects/continual-vidl/FrozenBiLM":$PYTHONPATH

# ego-exo
export PYTHONPATH="/Users/klaus/My Drive/projects/ego_exo/Grounded-Segment-Anything/GroundingDINO":$PYTHONPATH
export PYTHONPATH="/Users/klaus/My Drive/projects/intern2023meta/ego_exo_translation/dataseter":$PYTHONPATH
export PYTHONPATH="/Users/klaus/My Drive/projects/intern2023meta/ego_exo_translation/DiT":$PYTHONPATH
export PYTHONPATH="/Users/klaus/My Drive/projects/ego-exo-translation/e2o-translation-ng-research":$PYTHONPATH

# long-video-vlm
export PYTHONPATH="/Users/klaus/My Drive/projects/long-video-llm/src/LLaVA":"/Users/klaus/My Drive/projects/long-video-llm/src/IG-VLM":$PYTHONPATH

export DYLD_LIBRARY_PATH="$(brew --prefix)/lib:$DYLD_LIBRARY_PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/$USER/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/$USER/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/$USER/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/$USER/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate py310

export PYTHONPATH=/Users/bytedance/Documents/projects/vfm:$PYTHONPATH

export OPENAI_API_KEY=duBzK9TkzDdroC7yfp4gozjuHkMc1VYs
