
# Setting PATH for Python 3.8
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.8/bin:${PATH}"
export PATH

export PATH=/Users/mattdenney/Library/Python/3.8/bin:$PATH


alias c="clear"
alias d="cd"
alias ..="cd .."
alias e="nvim"
alias eb="nvim ~/.bash_profile"
alias ei="nvim ~/.config/i3/config"
alias ev="nvim ~/.config/nvim/init.vim"
alias o="xdg-open ."
alias a="python3 ~/Tools/audio_change.py"
alias w="rofi -show window"
alias m="~/Files/melee/slippi.AppImage"
alias sb="ssh -i ~/.pem/sandbox.pem root@192.81.132.158"
alias vb="virtualbox"
alias vm='VBoxManage startvm "Windows 10"'
alias srb='source ~/.bash_profile'
alias pw='node ~/Tools/vigenere.js ~/Tools/t'
alias ns="npm start"
alias sc="gnome-screenshot a"
alias cc='echo "ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.wav"'
~/.screenlayout/default_layout.sh

source .inputrc


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

