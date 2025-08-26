#!/bin/sh
config=$HOME/.config/dedproton
lib=$HOME/.local/share/dedproton
mkdir -p $config $lib
echo "n
1" > $config/default.cfg
echo "MANGOHUD=1
PROTON_NO_WM_DECORATION=1
UMU_NO_RUNTIME=1
PROTON_PREFER_SDL_INPUT=1" > $config/env
curl -fsSL "https://raw.githubusercontent.com/luarocks/argparse/refs/heads/master/src/argparse.lua" -o $lib/argparse.lua
find / -executable -name "proton" -fprint $config/protons
