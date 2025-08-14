#!/usr/bin/env luajit
local user = os.getenv("USER")
::file::
local configfileread = io.open("/home/" .. user .. "/.config/dedproton/default.cfg", "r")
if configfileread == nil then
    os.execute("mkdir /home/" .. user .. "/.config/dedproton")
    goto file
end

local function lineread(linenum)
    local cur = 1
    for line in configfileread:lines() do
        if cur == linenum then
            return line
        end
        cur = cur + 1
    end
    configfileread:close()
end

local argparse = require("argparse")
local parser = argparse("DED-proton", "DED-proton")
local tab = { ' STEAM_COMPAT_CLIENT_INSTALL_PATH="/home/' ..
user ..
'/.local/share/Steam" STEAM_COMPAT_DATA_PATH="/home/' ..
user .. '/.local/share/proton-pfx/0" MANGOHUD=1 PROTON_NO_WM_DECORATION=1 UMU_NO_RUNTIME=1 PROTON_PREFER_SDL_INPUT=1 ' }
local default = lineread(1)
local read = lineread(1)
local function protonchoose()
    if default == "y" then
        if tonumber(read) == 1 then
            return "/usr/share/steam/compatibilitytools.d/proton-cachyos/proton"
        elseif tonumber(read) == 2 then
            return "/usr/share/steam/compatibilitytools.d/proton-ge-custom/proton"
        end
    else
        local read = tonumber(io.read())
        if read == 1 then
            return "/usr/share/steam/compatibilitytools.d/proton-cachyos/proton"
        elseif read == 2 then
            return "/usr/share/steam/compatibilitytools.d/proton-ge-custom/proton"
        end
    end
end

parser:flag "-W --wayland"
parser:flag "-B --vkbasalt"
parser:flag "-q --quiet"
parser:flag "-x --xim"
parser:argument("game", "the game itself")
local args = parser:parse()

if args.wayland == true then
    table.insert(tab, "PROTON_ENABLE_WAYLAND=1 ")
    print("PROTON_ENABLE_WAYLAND=1 ")
end

if args.vkbasalt == true then
    table.insert(tab, "ENABLE_VKBASALT=1 ")
    print("ENABLE_VKBASALT=1 ")
end

if args.xim == true then
    table.insert(tab, "PROTON_NO_XIM=0 ")
    print("PROTON_NO_XIM=0 ")
end
local proton
if default == "y" then
   print([[choose a proton version:
    1: proton-cachyos
    2: proton-ge-custom]])
    print(read)
else
    print([[choose a proton version:
    1: proton-cachyos
    2: proton-ge-custom]])
end

proton = protonchoose()

if args.quiet == true then
    os.execute(table.concat(tab) .. 'gamemoderun ' .. proton .. ' run "' .. args.game ..
        '" >/tmp/proton-cachyos.log 2>&1')
else
    os.execute(table.concat(tab) .. 'gamemoderun ' .. proton .. ' run "' .. args.game .. '"')
end
