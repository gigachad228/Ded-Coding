# PROTON

proton.lua is a CLI wrapper script for protons in ~/.steam/root/compatibilitytools.d

For proton.lua you need to execute forlua.sh file

proton.lua has flags "-W" "-B" "-v" "-q" "-X"

## FLAGS

"-W" is for "PROTON_ENABLE_WAYLAND=1"

"-B" is for "ENABLE_VKBASALT=1"

"-X" is for "PROTON_NO_XIM=0"

"-v" is for version of the wrapper

"-q" is for quietness of the proton, -q for silencing proton, -qq for silencing the wrapper and proton

forlua.sh makes directories ~/.config/dedlua/ and ~/.local/share/dedlua/ (the last one is for dependencies and a prefix for proton.lua)

It also finds every proton in your ~/.steam/root/compatibilitytools.d and puts it into ~/.local/share/protons file, where it found every proton. It also makes a ~/.config/dedlua/default.cfg, a file that should look like this:

```
n
1
```

It is by default turned off, the first line is for "n" or "y" values and it defines if your proton autochooses by the next value, a number. A number is a line in the "protons" file that you can freely write yourself if your preferred proton version wasn't found.

The third file is ~/.config/dedlua/env, it has YOUR environment variables, you can add to or remove the default ones the forproton.sh, here are they btw:

```
MANGOHUD=1
STEAM_COMPAT_CLIENT_INSTALL_PATH="~/.local/share/Steam"
```

Mine looks like this:

```
MANGOHUD=1
STEAM_COMPAT_CLIENT_INSTALL_PATH="~/.local/share/Steam"
QT_QPA_PLATFORM=wayland
SDL_VIDEODRIVER=wayland
MOZ_ENABLE_WAYLAND=1
MESA_LOADER_DRIVER_OVERRIDE=zink
GALLIUM_DRIVER=zink
VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/radeon_icd.x86_64.json
XDG_SESSION_TYPE=wayland
WLR_RENDERER=vulkan
__GLX_VENDOR_LIBRARY_NAME=mesa
GDK_BACKEND=wayland
CLUTTER_BACKEND=wayland
gamemoderun
```

Each environment variable should be on different lines, althought you can just store them in one line if you want, just be sure to add space in the end and at the start of the line. Also you can add gamemoderun to the last line and it will run it, I also made so that you can comment what environment variables you don't need!

The fourth file is your proton prefix, which is ~/.config/dedlua/pfx, you can edit the value to choose a different prefix, you can also make a new prefix, just make a new directory, set the value to that directory and run

```bash
proton.lua boot
```

Here is the default value for pfx:

```bash
STEAM_COMPAT_DATA_PATH=~/.local/share/dedlua/pfx
```

There is also files that don't appear by executing forlua.sh, they are .config/dedlua/prestart and .config/dedlua/poststart, these both files are made for executing command before and after the proton command, prestart for commands that execute themselves before proton and poststart for commands that execute themselves after proton. They both should be written in "sh" syntax.