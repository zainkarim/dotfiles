#!/bin/bash

echo "🛠️  Setting up your new Mac..."

# Install Homebrew if not installed
if ! command -v brew >/dev/null; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

echo "📦 Installing packages from Brewfile..."
brew bundle --file=~/dotfiles/Brewfile

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "⚡ Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✅ Oh My Zsh already installed"
fi

# Install Powerlevel10k
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  echo "🎨 Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
  echo "✅ Powerlevel10k already installed"
fi

# Install ZSH plugins
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
PLUGINS_DIR="$ZSH_CUSTOM/plugins"

[[ ! -d "$PLUGINS_DIR/zsh-autosuggestions" ]] && \
  git clone https://github.com/zsh-users/zsh-autosuggestions "$PLUGINS_DIR/zsh-autosuggestions"

[[ ! -d "$PLUGINS_DIR/zsh-syntax-highlighting" ]] && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$PLUGINS_DIR/zsh-syntax-highlighting"

# Symlink dotfiles
echo "🔗 Symlinking config files..."
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh

# VSCode extensions
if command -v code >/dev/null; then
  echo "🧩 Installing VSCode extensions..."
  while read extension; do
    code --install-extension "$extension" || echo "⚠️ Could not install: $extension"
  done < ~/dotfiles/vscode/extensions.txt

  echo "🛠️  Copying VSCode settings..."
  mkdir -p ~/Library/Application\ Support/Code/User
  cp ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
else
  echo "⚠️ VSCode not found — skipping extensions/settings"
fi

# Configure iTerm2 to load preferences from dotfiles
echo "🔧 Configuring iTerm2 to use custom preferences..."
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/dotfiles/iterm2"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

echo "✅ Setup complete! Restart your terminal to apply changes."

