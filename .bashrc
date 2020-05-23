# .bashrc

export PATH=$PATH:$HOME/.local/bin:$HOME/bin

# load nvm
export NVM_DIR="$HOME/.nvm"
[ "$BASH_VERSION" ] && npm() { 
    # hack: avoid slow npm sanity check in nvm
    if [ "$*" == "config get prefix" ]; then which node | sed "s/bin\/node//"; 
    else $(which npm) "$@"; fi 
}
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
rvm_silence_path_mismatch_check_flag=1 # prevent rvm complaints that nvm is first in PATH
unset npm # end hack


# User specific aliases and functions
alias python=python36

# modifications needed only in interactive mode
if [ "$PS1" != "" ]; then
    # Set default editor for git
    git config --global core.editor /usr/bin/nano

    # Turn on checkwinsize
    shopt -s checkwinsize

    # keep more history
    shopt -s histappend
    export HISTSIZE=100000
    export HISTFILESIZE=100000
    export PROMPT_COMMAND="history -a;"

    # Source for Git PS1 function
    if ! type -t __git_ps1 && [ -e "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
        . /usr/share/git-core/contrib/completion/git-prompt.sh
    fi

    # Cloud9 default prompt
    _cloud9_prompt_user() {
        if [ "$C9_USER" = root ]; then
            echo "$USER"
        else
            echo "$C9_USER"
        fi
    }

    PS1='\[\033[01;32m\]$(_cloud9_prompt_user)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 " (%s)" 2>/dev/null) $ '
fi

[[ -s "$HOME/.rvm/environments/default" ]] && source "$HOME/.rvm/environments/default"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias laravel_start="cd ~/environment/gratisin-back && sudo php artisan serve --host=0.0.0.0 --port=8080"
alias gratisin-back="cd ~/environment/gratisin-back"
alias gb="cd ~/environment/gratisin-back"
alias g="cd ~/environment/gratisin"
alias gbt="cd ~/environment/gratisin-back && php artisan tinker"
alias t="php artisan tinker"

alias react_start="cd ~/environment/gratisin && PORT=8081 yarn start"
alias cd_front="cd ~/environment/gratisin"
alias recon="cd ~/environment/hack/recon/output"

alias db_start="sudo service mysqld start"
alias tg="tmux attach -t gratisin"
alias ts="tmux attach -t start"
alias c="clear"
alias bashrc="vim ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias tink="php artisan tinker"


export PATH="$(yarn global bin):$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/bin/sublister:$PATH"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
