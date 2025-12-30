# Profile zsh startup (only if ZSH_DEBUG=1)
# export ZSH_DEBUG=1
if [[ "$ZSH_DEBUG" == "1" ]]; then
  zmodload zsh/zprof
fi

### Zinit Setup ###
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33}Installing zinit...%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Load completions plugin first (with compinit caching)
zinit wait lucid light-mode for \
  blockf atpull'zinit creinstall -q .' \
    zsh-users/zsh-completions

# Load zsh-titles immediately (needed for tmux window names)
zinit light jreese/zsh-titles

# Load other plugins with turbo mode
zinit wait lucid light-mode for \
  atload"_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions \
    zdharma-continuum/fast-syntax-highlighting

# Fast compinit with caching (only check once per day)
autoload -Uz compinit
setopt EXTENDEDGLOB
for dump in ~/.zcompdump(N.mh+24); do
  compinit -d ~/.zcompdump
done
compinit -C -d ~/.zcompdump
unsetopt EXTENDEDGLOB

# zsh-vi-mode (loaded with turbo for speed)
zinit ice depth=1 wait'0a' lucid
zinit light jeffreytse/zsh-vi-mode

# Prompt
# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure
# zstyle :prompt:pure:git:stash show yes
eval "$(starship init zsh)"

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
    export OPENAI_API_KEY=$(cat ~/.openai_api_key)
fi

# Aliases
alias l='ls -al --color'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias c='cursor .'
# pnpm
alias pi='pnpm install'
alias pd='pnpm run dev'
alias pdf='pnpm run dev:fresh'
# poetry
alias pm='poetry run python -m'
alias ptu='poetry run pytest -n auto tests/unit/'
alias pti='poetry run pytest tests/integration/'

# python
autoflake_staged() {
  local git_root files
  git_root=$(git rev-parse --show-toplevel)

  # Collect staged Python files (absolute paths, one per line)
  files=$(git diff --cached --name-only --diff-filter=ACM -- '*.py' | sed "s|^|$git_root/|")

  if [[ -z "$files" ]]; then
    echo "No staged Python files."
    return 0
  fi

  echo "Running autoflake on staged Python files..."
  # Use xargs -0 to handle spaces safely
  echo "$files" | tr '\n' '\0' | xargs -0 poetry run autoflake --remove-all-unused-imports --in-place

  echo "✅ Autoflake complete."
}
alias ui=autoflake_staged

# tmux
alias ts="tmux-sessionizer"
alias ta="tmux attach"
alias tcs="tmux-clean-sessions.sh"

# miscellaneous
alias nv='source .venv/bin/activate'
alias pnv='$(poetry env activate)'
alias main='git checkout main; git pull; git fetch -p'
alias mvnpush='mvn clean install && git push'
alias ngpush='npm run lint && npm run test_ci && git push'

# colima
# export DOCKER_HOST="unix://$HOME/.colima/docker.sock"
unset DOCKET_HOST

# brew
export PATH="/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/opt/unzip/bin:$PATH"

# Zoxide (lazy loaded)
_zoxide_init() {
  unfunction z 2>/dev/null
  eval "$(zoxide init --cmd z zsh)"
}
z() { _zoxide_init; z "$@" }

# Lazygit
alias lg=lazygit

# atuin
# zsh-vi-mode overrides atuin bindings, so we need to do this
source $HOME/.atuin/bin/env
zvm_after_init_commands+=('eval "$(atuin init zsh --disable-up-arrow)"')

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
d() {
  nvim +"CodeDiff $1"
}
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

# Pyenv (lazy loaded)
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
_pyenv_init() {
  unfunction pyenv 2>/dev/null
  eval "$(command pyenv init -)"
}
pyenv() { _pyenv_init; pyenv "$@" }
# Local dev
export LOCAL_DATABASE=true
alias b='cd backend'

# Github
export GITHUB_TOKEN=$(gh auth token 2>/dev/null)

# AWS
export AWS_PROFILE='shared-services-dev'
alias asl='aws sso login --profile $AWS_PROFILE'
alias ae='unset AWS_ACCESS_KEY_ID AWS_CREDENTIAL_EXPIRATION AWS_SECRET_ACCESS_KEY && eval "$(aws configure export-credentials --format env)"'
alias ap='ae && pd'

# GCP
alias gl='gcloud auth application-default login'

# make
alias ma='VERBOSE=true make api'
alias mt='VERBOSE=true make task-server'

# Source custom functions
for function_file in ~/.zsh/functions/*.zsh; do
  source $function_file
done

change_environment() {
    if [ -z "$1" ]; then
        echo "Usage: ce <environment>"
        echo "       ce <prefix> <environment>"
        echo "Example: ce dev           → shared-services-dev"
        echo "Example: ce mycompany prod → mycompany-prod"
        return 1
    fi

    if [ -z "$2" ]; then
        export ENVIRONMENT=$1
        export AWS_PROFILE=shared-services-$1
    else
        export ENVIRONMENT=$2
        export AWS_PROFILE=$1-$2
    fi
    asl
    echo "AWS_PROFILE=$AWS_PROFILE"
}
alias cn=change_environment

# SDKMAN (lazy loaded)
export SDKMAN_DIR="$HOME/.sdkman"
_sdkman_init() {
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  # Remove the aliases after first use
  for cmd in sdk java gradle maven kotlin scala sbt; do
    unalias $cmd 2>/dev/null
  done
}
# Create aliases for lazy loading
for cmd in sdk java gradle maven kotlin scala sbt; do
  alias $cmd="_sdkman_init; $cmd"
done

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jonathan/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jonathan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jonathan/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jonathan/google-cloud-sdk/completion.zsh.inc'; fi

# Show profiling results if ZSH_DEBUG=1
if [[ "$ZSH_DEBUG" == "1" ]]; then
  zprof
fi
