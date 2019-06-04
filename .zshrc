# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:/usr/local/lib/node_modules:/usr/local/go:$HOME/go:$HOME/go/bin:/opt/local/bin:/opt/local/sbin:/opt/local/libexec/gnubin:$HOME/bin:$PATH
#export PATH=/usr/bin:/usr/local/lib/node_modules:/usr/local/go:$HOME/go:$HOME/go/bin:/opt/local/bin:/opt/local/sbin:/opt/local/libexec/gnubin:$HOME/bin:$PATH

ZSH="$HOME/.oh-my-zsh"

# Path to your oh-my-zsh installation.
export ZSH=/Users/chrisb/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d/%m/%Y}"
POWERLEVEL9K_OK_ICON='\uF42E'
POWERLEVEL9K_FAIL_ICON='\uF468'
POWERLEVEL9K_ROOT_ICON='\uF0E7'
POWERLEVEL9K_TEST_ICON='\uF188'
POWERLEVEL9K_BATTERY_ICON='\uF188'
POWERLEVEL9K_NETWORK_ICON='\uF0EC'
POWERLEVEL9K_SERVER_ICON='\uF474'
POWERLEVEL9K_VCS_BRANCH_ICON='\uF418 '
POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON='\uF484 '
POWERLEVEL9K_VCS_TAG_ICON='\uF02B '
POWERLEVEL9K_VCS_BOOKMARK_ICON='\uF02E '
POWERLEVEL9K_VCS_COMMIT_ICON='\uE729 '
POWERLEVEL9K_RUST_ICON='\uE7A8'
POWERLEVEL9K_PYTHON_ICON='\uE606'
POWERLEVEL9K_SYMFONY_ICON='\uE756'
POWERLEVEL9K_HOME_ICON='\uF015 '
POWERLEVEL9K_HOME_SUB_ICON='\uF07C '
POWERLEVEL9K_FOLDER_ICON='\uF115 '

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  chucknorris git git-extras git-remote-branch git-flow gitignore bower grunt osx macports node npm sublime sudo z
)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh"

export TERM="xterm-256color"
export EDITOR="/usr/local/bin/nvim"
export LS_OPTIONS="--color"

# Automatically add overcommit hooks to new git reops
#export GIT_TEMPLATE_DIR=`overcommit --template-dir`

export NVIM_PYTHON_LOG_FILE="/private/tmp/log"
export NVIM_PYTHON_LOG_LEVEL=DEBUG

export HTML_TIDY=".tidy-config"

export TESSEL=Tesselhoff

export NODE_ENV=development
export BABEL_ENV=$NODE_ENV

export PATH="$HOME/.cargo/bin:$PATH"

# Enable tab completion in colorls
source $(dirname $(gem which colorls))/tab_complete.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

mongostop_func () {
  local mongopid=`less /opt/local/var/db/mongodb_data/mongod.lock`;
  if [[ $mongopid =~ [[:digit:]] ]]; then
    sudo kill -15 $mongopid;
    echo mongod process $mongopid terminated;
  else
    echo mongo process $mongopid not exist;
  fi
}

alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/Dropbox/.config/nvim/init.vim"
#alias vimconfig="nvim ~/.Spacevim.d/init.vim"
alias ohmyzsh="nvim ~/.oh-my-zsh"

#alias l='gls $LS_OPTIONS'
#alias ll='gls $LS_OPTIONS -lh'
#alias lll='gls $LS_OPTIONS -alh'

alias l="colorls --sort-dirs --git-status"
alias ll="colorls --sort-dirs --git-status --almost-all --long"
#alias ld="colorls --sort-dirs --git-status --dirs --long"

alias gup="sudo gem update --system;sudo gem update"
#alias nup="sudo -H chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share};npm cache clean -f;n latest;npm install npm -g;npm update -g;"
alias nup="sudo -H chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share};nvm cache clear;nvm install --lts;nvm install --latest-npm;npm update -g;"
alias pup="sudo port selfupdate;sudo port upgrade outdated;"

alias flushdnscache="sudo killall -HUP mDNSResponder"
alias fixnpmperms="sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}"
alias mktags="find . -type f -iregex \".*\.js$\" -not -path \"./node_modules/*\" -not -path \"./bower_components/*\" -not -path \"./dist/*\" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags"
alias mongostart="sudo mongod -f /opt/local/etc/mongodb/mongod.conf --httpinterface"
alias mongostop="mongostop_func"
alias npmgi="npm i -g @angular/cli eslint eslint-config-airbnb-base eslint-config-prettier eslint-plugin-import eslint-plugin-jsx-a11y eslint-plugin-prettier eslint-plugin-react gulp-cli htmlhint jsonlint lesshint neovim prettier stylelint stylelint-config-recommended-scss stylelint-scss typescript vimlint"
alias nvimbuild="cd /usr/local/repos/neovim;rm -rf ./build;sudo rm -rf ./.deps;git fetch -a;git pull;make clean;make distclean;make CMAKE_BUILD_TYPE=RelWithDebInfo;sudo make install;"
alias pipup="sudo -H pip freeze — local | grep -v ‘^\-e’ | cut -d = -f 1 | xargs -n1 pip install -U"
alias wireshark="sudo /Applications/Wireshark.app/Contents/MacOS/Wireshark"

alias gitmod="git log --no-merges --stat --reverse master.."

alias awk="gawk"
alias clr="clear"
alias cmp="gcmp"
alias diff3="gdiff3"
alias date="gdate"
alias diff="gdiff"
alias sdiff="gsdiff"
alias sed="gsed"
alias rm="trash"
alias top="htop"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
