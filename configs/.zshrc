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

# Alias
alias tf="terraform"

# Init dev tools
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
[ -s "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.yvm/yvm.sh" ] && source "$HOME/.yvm/yvm.sh"

# Path
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:$DOTFILES/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.dotnet"
export PATH="$PATH:$HOME/.bun/bin"


# Prompt
export PROMPT="%F{white}[%*]%f %F{magenta}%n%f%F %F{blue}%~%f"$'\n'"> "

# Terminal tools
[ -s "$HOME/.fzf.zsh" ] && source ~/.fzf.zsh
