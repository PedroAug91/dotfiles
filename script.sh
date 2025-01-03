sudo apt update -y 
sudo apt upgrade -y

sudo apt install snapd git curl build-essential dkms perl wget gcc make terminator -y

snap install nvim --classic
snap install insomnia

sudo apt install zsh -y
chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install node
nvm use node

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

brew install lazygit yazi fzf fd jq

curl https://sh.rustup.rs -sSf | sh
. "$HOME/.cargo/env"

cp ./.zshrc ~/

cp -r ./terminator ~/.config/
cp -r ./yazi ~/.config/
cp -r ./nvim ~/.config/
cp -r ./lazygit ~/.config/
