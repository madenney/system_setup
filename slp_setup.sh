cd ~
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
./build-linux playback