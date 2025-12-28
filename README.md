# My coding stuff!

## Links
- [Installing](#installing)
- [LUA scripts](#lua)
- [WARNING](#warning)
  - [FIXES](#fixes)
- [LICENSE](#LICENSE)

## Installing

```bash
git clone https://github.com/gigachad228/Ded-Coding.git
cd Ded-Coding
```

## LUA
I mostly use luajit version of the lua because its faster, but i don't usually use ffi, so its good.

For proton.lua you need to execute forlua.sh file

Also it makes directories ~/.config/dedlua/ and ~/.local/share/dedlua (the last one is for dependencies)

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

Each environment variable should be on different lines, althought you can just store them in one line if you want, just be sure to add space in the end and at the start of the line. Also you can add gamemoderun to the last line and it will run it!

The fourth file is your proton prefix, which is ~/.config/dedlua/pfx, you can edit the value to choose a different prefix, you can also make a new prefix, just make a new directory, set the value to that directory and run

```bash
proton.lua boot
```

Here is the default value for pfx:

```bash
STEAM_COMPAT_DATA_PATH=~/.local/share/dedlua/pfx
```

## WARNING

### FIXES
if forlua.sh doesn't make files "env" "default.cfg", delete ~/.config/dedlua/env and/or ~/.config/default.cfg

```bash
rm -f ~/.config/dedlua/env ~/.config/dedlua/default.cfg
```