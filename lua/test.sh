#!/usr/bin/env bash
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

