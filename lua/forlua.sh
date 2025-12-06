#!/usr/bin/env bash
config=$HOME/.config/dedlua
lib=$HOME/.local/share/dedlua
pfx=$HOME/.local/share/dedlua/pfx
echo "making directories $config, $lib and $pfx"
mkdir -p $config $lib $pfx
echo "making $config/default.cfg"
echo "n
1" > $config/default.cfg
echo "making $config/env"
echo "MANGOHUD=1
PROTON_NO_WM_DECORATION=1
UMU_NO_RUNTIME=1
PROTON_PREFER_SDL_INPUT=1
STEAM_COMPAT_DATA_PATH=$HOME/.local/share/dedlua/pfx" > $config/env
echo "copying from ownlibs to $lib"
cp ./ownlibs/* $lib
echo "finding protons and putting them into $lib/protons"
find / -executable -name "proton" -fprint $lib/protons
echo "checking if $pfx exists"
if [[ -d $pfx ]] && [[ -e $pfx/version]]; then
    echo "you already have $pfx/version, not doing anything"
    :
else
    echo "making a prefix directory at $pfx"
    mapfile -t options < <(cat ~/.local/share/dedlua/protons)
    PS3="Choose Proton version:"
    select choice in "${options[@]}"; do
        if [[ -n "$choice" ]]; then
            export STEAM_COMPAT_DATA_PATH=$HOME/.local/share/dedlua/pfx
            export STEAM_COMPAT_CLIENT_INSTALL_PATH=$HOME/.local/share/Steam
            exec "$choice" run boot
        else
            echo "Wrong choice. Try again"
        fi
    done
fi


