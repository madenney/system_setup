mkdir Projects
cd Projects
git clone https://github.com/madenney/system_setup

cd ~
cp ~/Projects/system_setup/bash_profile .bash_profile
cp Projects/system_setup/.inputrc .inputrc
sed -i '1 i\source .bash_profile' .bashrc
source .bashrc

cd ~
mkdir ~/.config
mkdir ~/.config/nvim
cp ~/Projects/system_setup/init.vim ~/.config/nvim/.
sudo apt-get install neovim
sudo ubuntu-drivers autoinstall
sudo apt-get install npm
sudo snap install nvm
sudo apt-get install curl

mkdir ~/Projects/sandbox
cd ~/Projects/sandbox
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
cd ~
source .bashrc

cd ~/Projects
git clone https://github.com/madenney/Archiver
git clone https://github.com/project-slippi/Ishiiruka

cd ~/Projects/Archiver
nvm install 18
npm i

cd ~/Projects/system_setup
chmod +x ./install_Ishiiruka_reqs.sh
./build_Ishiiruka.sh
cd ~/Projects/Ishiruuka
git checkout 0dcbe64765d67d3bd24133237c18e76e30bf3914
./build-linux playback
