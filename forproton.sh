#!/bin/bash
config=$HOME/.config/dedproton
lib=$HOME/.local/share/dedproton
mkdir -p $config $lib
echo "n
1" > $config/default.cfg
echo "MANGOHUD=1
PROTON_NO_WM_DECORATION=1
UMU_NO_RUNTIME=1
PROTON_PREFER_SDL_INPUT=1" > $config/env
cp ./ownlibs/argparse.lua $lib
find / -executable -name "proton" -fprint $config/protons
