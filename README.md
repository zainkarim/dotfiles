# 💻 Zain’s Dotfiles

Repository to bootstrap a new macOS setup with:
- Zsh + Oh My Zsh + Powerlevel10k
- iTerm2 preferences & color themes
- VSCode extensions
- Homebrew CLI tools & GUI apps

## ⚙️ Structure

dotfiles/
├── .p10k.zsh
├── .zshrc
├── Brewfile
├── install.sh
├── iterm2/
│ ├── com.googlecode.iterm2.plist
│ └── colors/
│ └── ...your .sh theme files...
└── vscode/
└── extensions.txt


## 🚀 Installation

### 🧪 One-liner (recommended):

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles && cd ~/dotfiles && chmod +x install.sh && ./install.sh
```

### 🧭 Manual steps:

```bash
# 1. Clone the repo
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Make the installer executable (optional on some systems)
chmod +x install.sh

# 3. Run the installer
./install.sh
```
