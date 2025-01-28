# System Setup

My unique collection of bash/python scripts to create and manage a customized Linux environment. This repository contains tools for configuring displays, audio, terminal settings, development environments, and more. It also includes backup and restore utilities to make transitioning between setups seamless.

---


## Setup

- Run the central script (currently not working):
 > ./build_system.sh

OR 

- Execute individual scripts as needed (details provided below).

---

## Scripts

### Display Management
Scripts to manage and switch between custom display configurations:
- **`activate_mirror.sh`**: Activates mirrored displays (1 of 3 display settings scripts).
- **`activate_tv_mode.sh`**: Configures display settings for TV output (1 of 3 display settings scripts).
- **`revert_displays.sh`**: Reverts to a default display configuration (1 of 3 display settings scripts).

### System Configuration
Scripts to set up and customize the Linux system:
- **`ubuntu_setup.sh`**: Automates the initial setup of Ubuntu with custom configurations.
- **`shortcuts.sh`**: Installs custom keyboard shortcuts.
- **`install_Ishiiruka_reqs.sh`**: Installs dependencies for a custom Dolphin emulator setup.
- **`slp_setup.sh`**: Sets up Slippi for GameCube netplay.

### Audio Management
Scripts for managing and toggling audio outputs:
- **`switch_audio_device.py`**: Toggles between three audio devices.

### Terminal and Development
Scripts for configuring the terminal and development environment:
- **`terminal_setup.sh`**: Configures the terminal environment with custom settings.
- **`bash_profile`**: Custom bash profile for aliases and environment variables.
- **`init.vim`**: Neovim configuration file.
- **`vimrc`**: Vim configuration file.

### Backup and Restore
Scripts and files for backing up and restoring settings:
- **`restore_gnome_settings.sh`**: Restores a backup of GNOME settings.
- **`gnome_settings_backup.dconf`**: Backup file containing GNOME settings.

### Miscellaneous
Other helpful scripts and files:
- **`build_system.sh`**: Central script to execute all other scripts (currently not up to date).
- **`toggle_nighttime.sh`**: Toggles a nighttime mode (self-explanatory).
- **`input.conf`**: MPV configuration backup for custom video player settings.
- **`web_server`**: Script to set up a remote server.