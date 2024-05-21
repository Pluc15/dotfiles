# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Find where dotfiles are cloned
export DOTFILES=$(dirname $(dirname $0))

# Add default arguments
alias ls='ls --color=auto'

# Init dev tools
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && source "/opt/homebrew/opt/nvm/nvm.sh" # If on Mac
[ -s "$HOME/.yvm/yvm.sh" ] && source "$HOME/.yvm/yvm.sh"
[ -s "/opt/homebrew/opt/yvm/yvm.sh" ] && source "/opt/homebrew/opt/yvm/yvm.sh" # If on Mac
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
command -v limactl >/dev/null 2>&1 && export DOCKER_HOST=$(limactl list docker --format 'unix://{{.Dir}}/sock/docker.sock')

# Path
export PATH="$PATH:$DOTFILES/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.bun/bin"

# Prompt
export PROMPT="%F{white}[%*]%f %F{magenta}%n%f%F %F{blue}%~%f"$'\n'"> "

# Terminal tools
[ -s "$HOME/.fzf.zsh" ] && source ~/.fzf.zsh
