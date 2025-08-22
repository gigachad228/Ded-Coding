#!/bin/sh
mkdir -p $HOME/.config/dedproton
echo "n
1" > $HOME/.config/dedproton/default.cfg
find / -executable -name "proton" 2>/dev/null 1>$HOME/.config/dedproton/protons
