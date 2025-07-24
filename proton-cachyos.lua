#!/usr/bin/env luajit
local argparse = require("argparse")
local parser = argparse("proton-cachyos", "proton-cachyos")
local standard = {' STEAM_COMPAT_CLIENT_INSTALL_PATH="/home/dedj/.local/share/Steam" STEAM_COMPAT_DATA_PATH="/home/dedj/.local/share/proton-pfx/0" MANGOHUD=1 PROTON_NO_WM_DECORATION=1 UMU_NO_RUNTIME=1 PROTON_DXVK_D3D8=1 PROTON_PREFER_SDL_INPUT=1 '}
local tab = {}
parser:flag "-W --wayland"
parser:flag "-B --vkbasalt"
parser:flag "-q --quiet"
parser:argument("game", "the game itself")
local args = parser:parse()
if args.wayland == true then
table.insert(tab,"PROTON_ENABLE_WAYLAND=1 ")
print("PROTON_ENABLE_WAYLAND=1 ")
end
if args.vkbasalt == true then
table.insert(tab,"ENABLE_VKBASALT=1 ")
print("ENABLE_VKBASALT=1 ")
end
if args.quiet == true then
os.execute(table.concat(tab) .. table.concat(standard) .. 'gamemoderun "/usr/share/steam/compatibilitytools.d/proton-cachyos/proton" "run" "' .. args.game .. '" >/tmp/proton-cachyos.log 2>&1')
else
os.execute(table.concat(tab) .. table.concat(standard) .. 'gamemoderun "/usr/share/steam/compatibilitytools.d/proton-cachyos/proton" "run" "' .. args.game .. '"')
end
