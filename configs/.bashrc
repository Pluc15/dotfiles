# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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

# Add default arguments
alias ls='ls --color=auto'

# Dev tools
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:~/dotfiles/bin"

# FZF bindings
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# Prompt
export PS1="${CL_WHITE}[${CL_LGRAY}\t${CL_WHITE}] ${CL_MAGENTA}\u${CL_CYAN}@${CL_PURPLE}\h ${CL_BLUE}\w\n${CL_LGRAY}>${CL_RESET} "
