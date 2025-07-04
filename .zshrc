# Profile zsh startup
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Pure (must go after oh-my-zsh)
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure
zstyle :prompt:pure:git:stash show yes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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
# HIST_STAMPS="mm/dd/yyyy"

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
    zsh-vi-mode
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
# Fix for bad ssh :(
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Secrets
if command -v security > /dev/null 2>&1; then
    export GITHUB_AUTH_TOKEN=$(security find-generic-password -a "$USER" -s 'GITHUB_AUTH_TOKEN' -w)
    export ARTIFACTORY_AUTH_TOKEN=$(security find-generic-password -a "$USER" -s 'ARTIFACTORY_AUTH_TOKEN' -w)
    export PIP_ARTIFACTORY_CREDS=$(security find-generic-password -a "$USER" -s 'PIP_ARTIFACTORY_CREDS' -w)
    export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s 'ANTHROPIC_API_KEY' -w)
    export OPENAI_API_KEY=$(cat ~/.openai_api_key)
fi

# Aliases
alias nv='source .venv/bin/activate'
alias main='git checkout main; git pull; git fetch -p'
alias mvnpush='mvn clean install && git push'
alias ngpush='npm run lint && npm run test_ci && git push'
alias ts="tmux-sessionizer"
alias ta="tmux attach"
alias tcs="tmux-clean-sessions.sh"

# colima
# export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
unset DOCKET_HOST

# brew
export PATH="/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/opt/unzip/bin:$PATH"

# xpress
export XPAUTH_PATH=/opt/xpressmp/bin/xpauth.xpr

export SUMO_HOME=/opt/homebrew/Cellar/sumo/1.20.0.reinstall/bin/

# Zoxide
eval "$(zoxide init --cmd cd zsh)" 

# Lazygit
alias lg=lazygit

# atuin
# zsh-vi-mode overrides atuin bindings, so we need to do this
zvm_after_init_commands+=(eval "$(atuin init zsh --disable-up-arrow)")

# Pnpm
alias pi=pnpm i
alias pd=pnpm run dev
# Neovim
alias vim=nvim
alias vi=nvim
alias v=nvim
alias vimdiff='nvim -d'
alias vd=vimdiff
alias vt='nvim -c "set noswapfile | set buftype=nofile | set nomodified"'
alias vj='nvim -c "set noswapfile | set buftype=nofile | set filetype=json | set nomodified"'

# TODO: can this be done in nvim?
# Java environment variables
export JDTLS_JVM_ARGS="-javaagent:$HOME/.local/share/nvim/mason/packages/lombok-nightly/lombok.jar"
export MAVEN_OPTS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-exports=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED --add-exports=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED --add-exports=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED --add-exports=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED --add-exports=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED"

# Add scripts to path
export PATH="$PATH:$HOME/.local/scripts"
export PATH="$PATH:$HOME/.local/bin"

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias nvm="unalias nvm; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; nvm $@" # Lazy load nvm

# TODO: lazy load nvm upon calling node/npm?
# HACK: not happy about this
# Make npm and node avaiable before nvm is loaded
export DEFAULT_NODE="v20.12.1"
export PATH="$PATH:$NVM_DIR/versions/node/$DEFAULT_NODE/bin"

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
#Lazy load sdkman
source "$SDKMAN_DIR/bin/sdkman-init.sh"
# sdk() {
#   unset -f sdk
#   [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
#   sdk "$@"
# }
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
