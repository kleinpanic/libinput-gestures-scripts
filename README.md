# libinput-gestures Configuration Scripts

This repository contains custom scripts for configuring and managing gestures using `libinput-gestures`. These scripts are designed to add productivity-enhancing gesture controls for your Linux desktop environment.

## 📋 Prerequisites

Before using these scripts, ensure you have the following dependencies installed:

- `libinput`
- `libinput-gestures`
- `xdotool`
- `skippy-xd` (for window management)

### Install Dependencies

To install the required dependencies, run:

```bash
# On Debian/Ubuntu-based systems
sudo apt install libinput-tools xdotool skippy-xd
```

### Setup `libinput-gestures`

1. Install `libinput-gestures` from source or package manager:

```bash
# Debian/Ubuntu
sudo apt install libinput-gestures

# Add your user to the `input` group:
sudo gpasswd -a $USER input
```

2. Verify installation:

```bash
libinput-gestures-setup autostart
libinput-gestures-setup start
```

## 📂 File Structure

```
├── libinput-gestures.conf   # Main configuration file for gestures
├── scripts/
│   ├── 3-finger-swipe-up.sh  # Triggers Skippy-XD for window overview
│   ├── 3-finger-tap.sh       # Launches dmenu
│   └── other-scripts.sh      # Custom scripts for other gestures
```

## ✨ Features

### 3-Finger Swipe Up (Activate Skippy-XD)

Swipe three fingers up to activate a window overview using `skippy-xd`. This gesture allows you to view all open windows and switch between them easily.

- Script: `scripts/3-finger-swipe-up.sh`
- Command used: `skippy-xd --activate-window-picker`

### 3-Finger Tap (Launch dmenu)

Tapping with three fingers on the trackpad will open `dmenu`, a fast and minimal application launcher for your desktop.

- Script: `scripts/3-finger-tap.sh`
- Command used: `dmenu_run`

### Custom Gestures

You can easily modify the existing gestures or add new ones by editing the `libinput-gestures.conf` file and linking them to your custom scripts. See the configuration section below for more details.

## ⚙️ Configuration

### `libinput-gestures.conf`

Here is an example of how the `libinput-gestures.conf` file is structured to trigger the scripts:

```ini
# Swipe Up (3 fingers): Open skippy-xd
gesture swipe up 3 xdotool exec ~/scripts/3-finger-swipe-up.sh

# Tap (3 fingers): Open dmenu
gesture swipe down 3 xdotool exec ~/scripts/3-finger-tap.sh

# Add more gestures below as needed...
```

To apply changes to the configuration, restart `libinput-gestures`:

```bash
libinput-gestures-setup restart
```

## 🛠️ Customization

- **Add New Gestures**: Modify the `libinput-gestures.conf` file and create new scripts inside the `scripts/` directory.
- **Debugging**: Run `libinput-gestures -d` to view gesture logs and troubleshoot any issues.
  
## 💡 Tips

- Ensure that your user is added to the `input` group by running `sudo gpasswd -a $USER input`.
- To autostart `libinput-gestures` on boot, run `libinput-gestures-setup autostart`.
- You can create more advanced gesture bindings by combining `xdotool` commands in your scripts.

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## 🤝 Contributions

Feel free to fork this repository and submit pull requests for any enhancements or additional gesture configurations you create!
