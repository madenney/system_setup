
# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

export PATH=/Users/mattdenney/Library/Python/3.8/bin:$PATH

# Remap caps to super
setxkbmap -option caps:super


alias c="clear"
alias d="cd"
alias ..="cd .."
alias e="nvim"
alias eb="nvim ~/.bash_profile"
alias ev="nvim ~/.config/nvim/init.vim"
alias o="xdg-open ."
alias w="rofi -show window"
alias m="~/Files/melee/slippi.AppImage"
alias sb="ssh -i ~/.pem/sandbox.pem root@192.81.132.158"
alias vb="virtualbox"
alias vm='VBoxManage startvm "Windows 10"'
alias srb='source ~/.bash_profile'
alias pw='node ~/Tools/vigenere.js ~/Tools/t'
alias ns="npm start"
alias pi="python3 index.py"
alias cc='echo "ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.wav"'
alias ct='echo ffmpeg -ss 00:01:00 -to 00:02:00 -i input.mp4 -c copy output.mp4'
alias dat='wine ~/Tools/Dat_Texture_Wizard/DAT\ Texture\ Wizard.exe'
alias nos='~/Tools/nosqlbooster4mongo-8.0.11.AppImage'
alias mong='sudo systemctl restart mongod'
alias mc='watch -t -n 0.0001 xdotool getmouselocation'
alias list_audio_devices="LANG=C pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d' ' -f2"

~/.screenlayout/default_layout.sh

source ~/.inputrc


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

. "$HOME/.cargo/env"
