
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.scripts:$HOME/.local/bin:$HOME/.npm/bin/:$HOME/go/bin/:/usr/local/go/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="bureau"
ZSH_THEME="robbyrussell"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode compleat z rust tmux gh ripgrep fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=pt_BR.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# npm set prefix ~/.npm
# PATH="$HOME/.npm/bin:$PATH"
# PATH="./node_modules/.bin:$PATH"
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vim='nvim'
alias vimconfig="nvim ~/.config/nvim/init.vim"
autoload -U colors && colors
alias ls="exa --group-directories-first --icons"
alias lg="exa --group-directories-first --icons --git-ignore"
alias la="exa --group-directories-first --icons -al --git"
alias ll="exa --group-directories-first --icons -l --git"
alias bt="bibtex-tidy --omit=abstract --curly --numeric --space=4 --align=13 --sort=key,type,author,-year --duplicates=key --no-escape --sort-fields=title,shorttitle,author,year,month,day,journal,booktitle,location,on,publisher,address,series,volume,number,pages,doi,isbn,issn,url,urldate,copyright,category,note,metadata --trailing-commas --encode-urls --no-remove-dupe-fields --wrap=80 --enclosing-braces=title --no-escape"
alias _cat="/usr/bin/cat"
alias cat="batcat -p"
alias tectonic="tectonic -X"
# alias btm="bibtex-tidy --omit=abstract --curly --numeric --space=4 --align=13 --sort=key,type,author,-year --duplicates=key --no-escape --sort-fields=title,shorttitle,author,year,month,day,journal,booktitle,location,on,publisher,address,series,volume,number,pages,doi,isbn,issn,url,urldate,copyright,category,note,metadata --trailing-commas --encode-urls --no-remove-dupe-fields --wrap=80 ~/.biblio.bib"

export EDITOR="$HOME/.local/bin/nvim"
export VISUAL="$HOME/.local/bin/nvim"
export SHELL="/bin/zsh"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

export XDG_CONFIG_HOME="$HOME/.config"

export R_LIBS_USER="$HOME/.R/site-library/"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval $(opam env)

NLTK_DATA="$HOME/.nltk_data"; export NLTK_DATA
CLTK_DATA="$HOME/.cltk_data"; export CLTK_DATA
STANZA_RESOURCES_DIR="$HOME/.stanza_resources"; export STANZA_RESOURCES_DIR

export PATH="$HOME/.poetry/bin:$PATH"

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

PATH="$HOME/.perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="$HOME/.perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/.perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/.perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5"; export PERL_MM_OPT;

export ZK_NOTEBOOK_DIR=$HOME/caderno/
alias diario='zk list diário'
alias bomdia='zk new diário'
alias afazeres='zk edit 0Z2icriP.md'
# bun completions
[ -s "/home/caiog/.bun/_bun" ] && source "/home/caiog/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
