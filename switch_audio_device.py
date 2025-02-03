import subprocess

# Define keywords to identify your preferred audio devices
DESIRED_SINKS = [
    {"keyword": "hdmi", "nickname": "Main Monitor"},
    {"keyword": "SteelSeries", "nickname": "Arctis Nova Headset"},
    {"keyword": "BEHRINGER", "nickname": "Behringer Audio Interface"},
]

def get_available_sinks():
    """Retrieve a list of all available sinks from PulseAudio."""
    try:
        sinks = subprocess.check_output(["pactl", "list", "short", "sinks"], text=True).splitlines()
        sink_list = []
        for sink in sinks:
            parts = sink.split("\t")  # Split by tab characters
            if len(parts) > 1:
                sink_list.append(parts[1])  # Extract the system name
        return sink_list
    except subprocess.CalledProcessError as e:
        print(f"Error getting sinks: {e}")
        return []

def get_matching_sinks():
    """Match available sinks to user-defined preferred sinks."""
    available_sinks = get_available_sinks()
    matched_sinks = []
    
    for sink in available_sinks:
        for desired in DESIRED_SINKS:
            if desired["keyword"].lower() in sink.lower():
                matched_sinks.append({"system_name": sink, "nickname": desired["nickname"]})
    
    return matched_sinks

def get_current_sink():
    """Get the currently active audio output sink."""
    try:
        return subprocess.check_output(["pactl", "get-default-sink"], text=True).strip()
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
        if not streams:
            print("No active audio streams to move.")
            return
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
    """Toggle between the dynamically detected audio output devices."""
    matched_sinks = get_matching_sinks()
    
    if not matched_sinks:
        print("No matching audio devices found.")
        return

    current_sink = get_current_sink()
    if current_sink is None:
        return

    # Find the index of the current sink
    current_index = next((i for i, device in enumerate(matched_sinks) if device["system_name"] == current_sink), -1)

    # Determine the next sink index
    next_index = (current_index + 1) % len(matched_sinks)

    # Switch to the next sink
    next_device = matched_sinks[next_index]
    set_default_sink(next_device["system_name"])
    move_streams_to_sink(next_device["system_name"])

    # Show a toast notification
    show_notification(f"Switched audio to: {next_device['nickname']}")

if __name__ == "__main__":
    toggle_audio_output()
