# envs
export TERM=xterm-256color

# history config
export HISTFILE=$HOME/.zsh-history
export HISTSIZE=100000
export SAVEHIST=100000
if [ $UID = 0 ]; then
  unset HISTFILE
  export SVAHIST=0
fi

# zsh opts
autoload -U compinit
autoload colors
autoload -Uz zmv
compinit
colors
setopt auto_cd
setopt auto_pushd
setopt correct
setopt nobeep
setopt list_types
setopt auto_list
setopt auto_menu
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt prompt_subst
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# aliases
alias zmv='noglob zmv -W'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias git-top='cd `git top`'
alias vim='nvim'

# *env
eval "$(rbenv init -)"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
export WORKON_HOME=$HOME/.virtualenvs
. /usr/bin/virtualenvwrapper.sh

# powerlevel9k
load_powerlevel9k()
{
    . /usr/share/fonts/awesome-terminal-fonts/fontawesome-regular.sh
    POWERLEVEL9K_MODE='awesome-fontconfig'
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs)
    POWERLEVEL9k_DIR_HOME_BACKGROUND='yellow'
    POWERLEVEL9K_DIR_HOME_BACKGROUND="yellow"
    POWERLEVEL9k_DIR_HOME_SUBFOLDER_BACKGROUND="yellow"
    POWERLEVEL9k_DIR_DEFAULT_BACKGROUND='yellow'
    POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true
    POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=""
    POWERLEVEL9K_DIR_PATH_SEPARATOR="  "
    POWERLEVEL9K_HOME_SUB_ICON=""
    . /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
}
load_powerlevel9k
