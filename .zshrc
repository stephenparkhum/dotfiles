# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

addBeforePath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF Ripgrep Settings
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Run 'nvm use' automatically every time there's 
# a .nvmrc file in the directory. Also, revert to default 
# version when entering a directory without .nvmrc
# enter_directory() {
# if [[ $PWD == $PREV_PWD ]]; then
#     return
# fi
# 
# PREV_PWD=$PWD
# if [[ -f ".nvmrc" ]]; then
#     nvm use
#     NVM_DIRTY=true
# elif [[ $NVM_DIRTY = true ]]; then
#     nvm use default
#     NVM_DIRTY=false
# fi
# }

export PROMPT_COMMAND=enter_directory

parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF='%f'
COLOR_USR='%F{243}'
COLOR_DIR='%F{197}'
COLOR_GIT='%F{39}'
NEWLINE=$'\n'

setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n - ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}${NEWLINE}%% '


# ALIASES 
alias zash='vim ~/.zshrc'
alias cl='clear'

# Neovim Alias
alias vim='nvim ' 
alias v.='nvim .'
alias vcon='chezmoi ~/.config/nvim'

# Config Alias
alias cs="config status"

## Git Aliases
alias ga='git add .;'
alias gs='git status;'
alias gb='git branch;'

## VS Code 
alias c.='code .'

## Python 
alias python='python3'

# Edit / View Config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

## Tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"

alias txl="tmux ls"

function tx () {
  tmuxifier load-session $1
}

export PATH=/usr/local/bin:/usr/local/sbin:~/bin:/usr/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh" --no-use

addBeforePath $NVM_DIR/versions/node/v18.20.4/bin:$PATH
addToPath /opt/homebrew/bin
addToPath /usr/bin
addToPath /usr/local/bin

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pnpm end

# Syntax highlighting in terminal
source $HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## Tmuxifier init
eval "$(tmuxifier init -)"

# Load rbenv automatically by appending
# the following to ~/.zshrc:

eval "$(rbenv init - zsh)"
