
# Setting PATH for Python 3.8
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
alias m="~/Files/melee/slippi.AppImage"
alias e="~/Tools/thunderbird/thunderbird"
alias g="xclip -selection clipboard < ~/.pem/git_token"
alias db="~/Tools/DbVisualizer/dbvis"
alias sb="ssh -i ~/.pem/sandbox.pem root@192.81.132.158"
alias vb="virtualbox"
alias vm='VBoxManage startvm "Windows 10"'
alias srb='source ~/.bash_profile'
alias pw='node ~/Projects/lib/vigenere.js ~/Projects/lib/t'
alias ns="npm start"
alias nd="npm run dev"
alias pi="python3 index.py"
alias cc='echo "ffmpeg -f concat -safe 0 -i mylist.txt -c copy output.wav"'
alias ct='echo ffmpeg -ss 00:01:00 -to 00:02:00 -i input.mp4 -c copy output.mp4'
alias dat='wine ~/Tools/Dat_Texture_Wizard/DAT\ Texture\ Wizard.exe'
alias nos='~/Tools/nosqlbooster4mongo-8.0.11.AppImage'
alias mong='sudo systemctl restart mongod'
alias mc='watch -t -n 0.0001 xdotool getmouselocation'
alias list_audio_devices="LANG=C pactl list | grep -A2 'Source #' | grep 'Name: ' | cut -d' ' -f2"
alias pf='printf "file '\''%s'\''\\n" * > file.txt'
alias cc='ffmpeg -f concat -i file.txt -c:v copy -b:v 15000k -af aresample=async=1:first_pts=0 -c:a aac -b:a 128k -fflags +genpts final.avi'

. "$HOME/.cargo/env"


scan() {
    if [ -z "$1" ]; then
        echo "Usage: scan_to_png <output_file_name>"
        return 1
    fi

    local device_name="airscan:e0:HP DeskJet 2700 series [824580] (USB)"
    local output_file="$1.png"

    echo "Scanning and saving as PNG..."
    scanimage --device-name="$device_name" --format=png > "$output_file"

    if [ $? -eq 0 ]; then
        echo "Scan saved as $output_file"
    else
        echo "An error occurred during scanning."
    fi
}
