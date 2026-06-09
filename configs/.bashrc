# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Figure out the full path of the dotfiles
export DOTFILES=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
export DOTFILES=$(dirname "$DOTFILES")

# Add default arguments
alias ls='ls --color=auto'

# Hotkeys
bind '"\C-h": backward-kill-word'

# Variables
CL_RESET='\[\e[0m\]'
CL_RED='\[\e[00;31m\]'
CL_GREEN='\[\e[00;32m\]'
CL_YELLOW='\[\e[00;33m\]'
CL_BLUE='\[\e[00;34m\]'
CL_MAGENTA='\[\e[00;35m\]'
CL_PURPLE='\[\e[00;35m\]'
CL_CYAN='\[\e[00;36m\]'
CL_LGRAY='\[\e[00;37m\]'
CL_LRED='\[\e[01;31m\]'
CL_LGREEN='\[\e[01;32m\]'
CL_LYELLOW='\[\e[01;33m\]'
CL_LBLUE='\[\e[01;34m\]'
CL_LMAGENTA='\[\e[01;35m\]'
CL_LPURPLE='\[\e[01;35m\]'
CL_LCYAN='\[\e[01;36m\]'
CL_WHITE='\[\e[01;37m\]'

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
export PATH="$PATH:$HOME/.local/bin"

# Prompt
export PS1="${CL_WHITE}[${CL_LGRAY}\t${CL_WHITE}] ${CL_MAGENTA}\u ${CL_BLUE}\w\n${CL_LGRAY}>${CL_RESET} "

# Terminal tools
[ -s "$HOME/.fzf.bash" ] && source ~/.fzf.bash
[ -s "/usr/share/fzf/key-bindings.bash" ] && source /usr/share/fzf/key-bindings.bash
[ -s "/usr/share/fzf/completion.bash" ] && source /usr/share/fzf/completion.bash
