# The only pre-req is git

# Get system_setup
cd ~
mkdir Projects
cd Projects
git clone https://github.com/madenney/system_setup

# Setup bash profile
echo "Setting up bash profile"
cd ~
cp ~/Projects/system_setup/bash_profile .bash_profile
cp Projects/system_setup/inputrc .inputrc
sed -i '1 i\source .bash_profile' .bashrc
source .bashrc

# Install necessary tools
echo "Installing useful tools"
sudo apt-get install npm
sudo apt-get install nvm
sudo apt-get install curl
sudo apt-get install htop

# Setup neovim
echo "Setting up neovim"
cd ~
mkdir ~/.config
mkdir ~/.config/nvim
cp ~/Projects/system_setup/init.vim ~/.config/nvim/.
sudo apt-get install neovim
# Vim Plugin Manager:
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Have to manually install plugins within nvim with 'PlugInstall' command

