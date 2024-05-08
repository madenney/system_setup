# The only pre-req is git

# Get system_setup
cd ~
mkdir Projects
cd Projects
sudo apt-get install git
git clone https://github.com/madenney/system_setup

echo "Running terminal_setup..."
cd ~
./Projects/system_setup/terminal_setup.sh

echo "Running Ubuntu setup..."
cd ~
./Projects/system_setup/ubuntu_setup.sh

echo "Running slp setup..."
cd ~
./Projects/system_setup/slp_setup.sh

