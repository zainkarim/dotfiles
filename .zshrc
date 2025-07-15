# Set ZSH framework path
export ZSH="$HOME/.oh-my-zsh"

# Set theme (Powerlevel10k)
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line if you want to disable automatic title setting
# DISABLE_AUTO_TITLE="true"

# Plugins to load
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k config if it exists
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Add Homebrew to PATH (for Apple Silicon and Intel Macs)
# Adjust based on your architecture
if [[ -d /opt/homebrew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d /usr/local/Homebrew ]]; then
  export PATH="/usr/local/bin:$PATH"
fi

# Custom aliases
alias cls='clear'
alias ll='ls -lah'
alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'

# Python & pip path
export PATH="$HOME/Library/Python/3.9/bin:$PATH"

# Set default editor
export EDITOR="code --wait"

# Load NVM (Node Version Manager) if installed
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Display system info on startup
neofetch

# FZF keybindings (if installed via Homebrew)
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

