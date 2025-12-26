#!/usr/bin/env bash
config=~/.config/dedlua
lib=~/.local/share/dedlua
pfx=~/.local/share/dedlua/pfx
echo "making directories $config, $lib and $pfx"
mkdir -p $config $lib $pfx
if [[ -e $config/default.cfg ]]; then
    echo "you already have $config/default.cfg, not doing anything"
    :
else
    echo "making $config/default.cfg"
    echo "n
    1" > $config/default.cfg
fi
if [[ -e $config/env ]]; then
    echo "you already have $config/env, not doing anything"
    :
else
    echo "making $config/env"
    echo 'MANGOHUD=1
    STEAM_COMPAT_CLIENT_INSTALL_PATH="~/.local/share/Steam"
    ' > $config/env
fi
if [[ -e $config/pfx ]]; then
    echo "you already have $config/pfx, not doing anything"
    :
else
    echo "STEAM_COMPAT_DATA_PATH=$pfx" > $config/pfx
fi
pfxfile="$(cat $config/pfx)"
echo "copying from ownlibs to $lib"
cp ./ownlibs/* $lib
echo "Should we find proton versions in root?"
PS3="Your choice:"
options=("yes" "no")
select choice in "${options[@]}"; do
    case $choice in
	"yes")
	    echo "finding protons and putting them into $lib/protons"
	    find / -executable -name "proton" -fprint $lib/protons
	    ;;
	"no")
	    break
	    ;;
	*) echo 'wrong choice!';;
    esac
done
echo "checking if $pfx exists"
if [[ -e $pfx/version ]]; then
    echo "you already have $pfx/version, not doing anything"
    :
else
    echo "making a prefix directory at $pfx"
    mapfile -t options < <(cat $lib/protons)
    PS3="Choose Proton version:"
    select choice in "${options[@]}"; do
        if [[ -n "$choice" ]]; then
            export $pfxfile
            export STEAM_COMPAT_CLIENT_INSTALL_PATH=~/.local/share/Steam
            exec "$choice" run boot
        else
            echo "Wrong choice. Try again"
        fi
    done
fi


