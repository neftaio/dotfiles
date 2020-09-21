# Uncomment for debug with `zprof`
# zmodload zsh/zprof

export DOTFILES_PATH=$HOME/.dotfiles
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.dotfiles/modules/zimfw

# ZSH Ops
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FCNTL_LOCK
# setopt autopushd

# Start zim
source ${ZIM_HOME}/init.zsh

# Removing the waiting dots from completion (...). Original: ~/.zim/modules/input/init.zsh
# expand-or-complete-with-redisplay() {
#   zle expand-or-complete
#   zle redisplay
# }

# Async mode for autocompletion
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_HIGHLIGHT_MAXLENGTH=300

source $DOTFILES_PATH/shell/init.sh

fpath=("$DOTFILES_PATH/shell/zsh/themes" "$DOTFILES_PATH/shell/zsh/completions" $fpath)

autoload -Uz promptinit && promptinit
prompt codelytv

source $DOTFILES_PATH/shell/zsh/key-bindings.zsh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#Jupyter local path installed using pip
export PATH="$HOME/.local/bin:$PATH"
