import subprocess
import os

# List of devices with system names and nicknames
# To get the list, run: pactl list short sinks
# Must edit /etc/pulse/default.pa to load them in
TOGGLE_DEVICES = [
    {"system_name": "alsa_output.hdmi_CARD_NVidia_DEV_1", "nickname": "Main Monitor"},
    {"system_name": "alsa_output.hdmi_CARD_NVidia_DEV_2", "nickname": "TV"},
    {"system_name": "alsa_output.usb-SteelSeries_Arctis_Nova_7X-00.iec958-stereo", "nickname": "Arctis Nova Headset"}
]

def get_current_sink():
    """Get the currently active audio output sink."""
    try:
        result = subprocess.check_output(["pactl", "get-default-sink"], text=True).strip()
        return result
    except subprocess.CalledProcessError as e:
        print(f"Error getting current sink: {e}")
        return None

def set_default_sink(sink_name):
    """Set the specified sink as the default."""
    try:
        subprocess.run(["pactl", "set-default-sink", sink_name], check=True)
        print(f"Switched to: {sink_name}")
    except subprocess.CalledProcessError as e:
        print(f"Error setting default sink: {e}")

def move_streams_to_sink(sink_name):
    """Move all active audio streams to the specified sink."""
    try:
        streams = subprocess.check_output(["pactl", "list", "short", "sink-inputs"], text=True).splitlines()
        for stream in streams:
            stream_id = stream.split()[0]
            subprocess.run(["pactl", "move-sink-input", stream_id, sink_name], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error moving streams: {e}")

def show_notification(message):
    """Show a toast notification using the Ubuntu notification system."""
    try:
        subprocess.run(["notify-send", "Audio Output Switcher", message], check=True)
    except Exception as e:
        print(f"Error showing notification: {e}")

def toggle_audio_output():
    """Toggle between the specified audio output devices."""
    current_sink = get_current_sink()
    if current_sink is None:
        return

    # Find the index of the current sink
    current_index = -1
    for i, device in enumerate(TOGGLE_DEVICES):
        if device["system_name"] == current_sink:
            current_index = i
            break

    # Determine the next sink index
    next_index = (current_index + 1) % len(TOGGLE_DEVICES)

    # Switch to the next sink
    next_device = TOGGLE_DEVICES[next_index]
    set_default_sink(next_device["system_name"])
    move_streams_to_sink(next_device["system_name"])

    # Show a toast notification
    show_notification(f"Switched audio to: {next_device['nickname']}")

if __name__ == "__main__":
    toggle_audio_output()
