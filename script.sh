#!/bin/bash

set -euo pipefail

echo "[1/10] Updating system..."
sudo apt update -y
sudo apt upgrade -y

echo "[2/10] Installing base packages..."
sudo apt install -y \
    git curl build-essential dkms perl wget gcc make \
    ca-certificates xclip stow zsh tmux

echo "[3/10] Installing Docker..."
# Add Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings
if [ ! -f /etc/apt/keyrings/docker.asc ]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
    sudo chmod a+r /etc/apt/keyrings/docker.asc
fi

# Add Docker repository
DOCKER_LIST="/etc/apt/sources.list.d/docker.list"
if [ ! -f "$DOCKER_LIST" ]; then
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
      sudo tee "$DOCKER_LIST" > /dev/null
fi

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Allow running docker without sudo
echo "[4/10] Configuring Docker group..."
sudo groupadd -f docker
sudo usermod -aG docker "$USER"
# Will require re-login for group changes to take effect

echo "[5/10] Installing NVM and Node.js..."
export NVM_DIR="$HOME/.nvm"
if [ ! -d "$NVM_DIR" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    . "$NVM_DIR/nvm.sh"
    nvm install node
    nvm use node
else
    echo "NVM already installed."
    . "$NVM_DIR/nvm.sh"
fi

echo "[6/10] Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "[7/10] Installing Brew packages..."
brew install lazygit yazi fzf fd jq neovim ripgrep

echo "[8/10] Installing Rust..."
if [ ! -f "$HOME/.cargo/bin/rustc" ]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    . "$HOME/.cargo/env"
else
    echo "Rust already installed."
    . "$HOME/.cargo/env"
fi

echo "[9/10] Installing PHP via php.new..."
/bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"

echo "[10/11] Running some exports..."

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export PATH="/home/pedro/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/pedro/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"


[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
echo "[10/10] Installing ZSH + Oh My Zsh..."
# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions" 2>/dev/null || echo "zsh-autosuggestions already installed"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" 2>/dev/null || echo "zsh-syntax-highlighting already installed"

# Set default shell to ZSH
if [ "$SHELL" != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi

echo "✅ Setup complete. Please log out and log back in to apply group changes (e.g., Docker group)."

