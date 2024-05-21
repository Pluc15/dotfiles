# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add default arguments
alias ls='ls --color=auto'

# Variables
export CL_RESET=$(echo -en '\033[0m')
export CL_RED=$(echo -en '\033[00;31m')
export CL_GREEN=$(echo -en '\033[00;32m')
export CL_YELLOW=$(echo -en '\033[00;33m')
export CL_BLUE=$(echo -en '\033[00;34m')
export CL_MAGENTA=$(echo -en '\033[00;35m')
export CL_PURPLE=$(echo -en '\033[00;35m')
export CL_CYAN=$(echo -en '\033[00;36m')
export CL_LGRAY=$(echo -en '\033[00;37m')
export CL_LRED=$(echo -en '\033[01;31m')
export CL_LGREEN=$(echo -en '\033[01;32m')
export CL_LYELLOW=$(echo -en '\033[01;33m')
export CL_LBLUE=$(echo -en '\033[01;34m')
export CL_LMAGENTA=$(echo -en '\033[01;35m')
export CL_LPURPLE=$(echo -en '\033[01;35m')
export CL_LCYAN=$(echo -en '\033[01;36m')
export CL_WHITE=$(echo -en '\033[01;37m')

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
export PS1="${CL_WHITE}[${CL_LGRAY}\t${CL_WHITE}] ${CL_MAGENTA}\u ${CL_BLUE}\w\n${CL_LGRAY}>${CL_RESET} "

# Terminal tools
[ -s "$HOME/.fzf.bash" ] && source ~/.fzf.bash
[ -s "/usr/share/fzf/key-bindings.bash" ] && source /usr/share/fzf/key-bindings.bash
[ -s "/usr/share/fzf/completion.bash" ] && source /usr/share/fzf/completion.bash
