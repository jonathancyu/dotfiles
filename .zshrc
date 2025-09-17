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
fpath+=("$(brew --prefix)/share/zsh/site-functions")
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


# Secrets
if command -v security > /dev/null 2>&1; then
    export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s 'ANTHROPIC_API_KEY' -w)
    export ANTHROPIC_API_KEY=$(security find-generic-password -a "$USER" -s 'ANTHROPIC_API_KEY' -w)
    export OPENAI_API_KEY=$(cat ~/.openai_api_key)
fi

# Aliases
alias c='cursor .'
alias pi='pnpm install'
alias pd='pnpm run dev'
alias pdf='pnpm run dev:fresh'
alias pm='poetry run python -m'
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

# Zoxide
eval "$(zoxide init --cmd z zsh)" 

# Lazygit
alias lg=lazygit

# atuin
# zsh-vi-mode overrides atuin bindings, so we need to do this
source $HOME/.atuin/bin/env
zvm_after_init_commands+=(eval "$(atuin init zsh --disable-up-arrow)")

# Pnpm
alias p='pnpm'
alias pi='pnpm i'
alias pd='pnpm run dev'
alias pt='pnpm run test'

# Neovim
alias vim=nvim
alias vi=nvim
alias v=nvim
alias vimdiff='nvim -d'
alias vd=vimdiff
alias vt='nvim -c "set noswapfile | set buftype=nofile | set nomodified"'
alias vj='nvim -c "set noswapfile | set buftype=nofile | set filetype=json | set nomodified"'

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

if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi

# Github
export GITHUB_TOKEN=$(gh auth token 2>/dev/null)

# AWS
export AWS_PROFILE=dompe-dev
alias asl='aws sso login'
alias asle='aws sso login && eval "$(aws configure export-credentials --profile dompe-dev --format env)"'
alias ap='asle && pd'

# Source custom functions
for function_file in ~/.zsh/functions/*.zsh; do
  source $function_file
done


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
