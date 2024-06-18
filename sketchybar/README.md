# SketchyBar Installation and Configuration Guide for Mac

## Introduction

SketchyBar is a highly customizable and scriptable macOS menu bar replacement. This guide will walk you through the steps to install and configure SketchyBar on your Mac M1, including setting up additional plugins for various functionalities.

## Prerequisites

1. **Homebrew**: Ensure you have Homebrew installed on your Mac. If not, install it using the following command:
    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

2. **SketchyBar Configuration Files**: Ensure you have the necessary configuration files (`sketchybarrc.sh`, `colors.sh`, and additional plugin scripts). These files contain the settings and color schemes for SketchyBar.

## Installation Steps

### Step 1: Install SketchyBar

1. Open Terminal.
2. Run the following command to install SketchyBar via Homebrew:
    ```bash
    brew install sketchybar
    ```

### Step 2: Copy Configuration Files

1. Ensure the configuration files are available in your preferred directory.
2. Copy the files to the SketchyBar configuration directory. For example, if the files are in the `Downloads` folder, use:
    ```bash
    mkdir -p ~/.config/sketchybar
    cp ~/Downloads/sketchybarrc.sh ~/.config/sketchybar/sketchybarrc.sh
    cp ~/Downloads/colors.sh ~/.config/sketchybar/colors.sh
    cp ~/Downloads/*.sh ~/.config/sketchybar/
    ```

### Step 3: Modify Configuration

1. Open `~/.config/sketchybar/sketchybarrc.sh` and `~/.config/sketchybar/colors.sh` in your preferred text editor (e.g., VSCode or nano) to customize settings as needed:
    ```bash
    nano ~/.config/sketchybar/sketchybarrc.sh
    nano ~/.config/sketchybar/colors.sh
    ```

### Step 4: Include Plugins in Configuration

1. Modify `sketchybarrc.sh` to include the additional plugins:
    ```bash
    #!/bin/bash

    # Import colors
    source ~/.config/sketchybar/colors.sh

    # Define bar settings
    sketchybar --bar height=24, background.color=$BLACK

    # Add items
    sketchybar --add item clock right \
               --set clock update_freq=1 \
                           label.padding_right=15 \
                           script="date '+%H:%M:%S'"

    # Include additional plugins
    source ~/.config/sketchybar/volume.sh
    source ~/.config/sketchybar/space_windows.sh
    source ~/.config/sketchybar/space.sh
    source ~/.config/sketchybar/network.sh
    source ~/.config/sketchybar/memory.sh
    source ~/.config/sketchybar/media.sh
    source ~/.config/sketchybar/keyboard_layout.sh
    source ~/.config/sketchybar/front_app.sh
    source ~/.config/sketchybar/disk.sh
    ```

### Step 5: Start SketchyBar

1. Run SketchyBar using the following command:
    ```bash
    sketchybar --config ~/.config/sketchybar/sketchybarrc.sh
    ```

2. To make SketchyBar start automatically on login, add the start command to your shell's startup file (e.g., `.zshrc` for zsh):
    ```bash
    echo "sketchybar --config ~/.config/sketchybar/sketchybarrc.sh &" >> ~/.zshrc
    ```

### Step 6: Restart Terminal

1. Close and reopen Terminal, or source the startup file:
    ```bash
    source ~/.zshrc
    ```

### Step 7: Enjoy Your New Menu Bar

Your new SketchyBar menu bar should now be running with the settings defined in your configuration files. Feel free to explore and tweak the settings further to suit your preferences.

## Example Configuration

Here is an example of what the configuration files might look like:

### `sketchybarrc.sh`

```bash
#!/bin/bash

# Import colors
source ~/.config/sketchybar/colors.sh

# Define bar settings
sketchybar --bar height=24, background.color=$BLACK

# Add items
sketchybar --add item clock right \
           --set clock update_freq=1 \
                       label.padding_right=15 \
                       script="date '+%H:%M:%S'"

# Include additional plugins
source ~/.config/sketchybar/volume.sh
source ~/.config/sketchybar/space_windows.sh
source ~/.config/sketchybar/space.sh
source ~/.config/sketchybar/network.sh
source ~/.config/sketchybar/memory.sh
source ~/.config/sketchybar/media.sh
source ~/.config/sketchybar/keyboard_layout.sh
source ~/.config/sketchybar/front_app.sh
source ~/.config/sketchybar/disk.sh
```

### `colors.sh`

```bash
#!/bin/bash

# Color definitions
BLACK=0xff000000
WHITE=0xffffffff
RED=0xffff0000
```

## Plugin Scripts

Here are examples of the additional plugin scripts:

Folder plugins + iteams


## Conclusion

You've successfully installed and configured SketchyBar on your Mac . Refer to the [official documentation](https://github.com/FelixKratz/SketchyBar) for more advanced configurations and features.


