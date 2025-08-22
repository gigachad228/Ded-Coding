#!/usr/bin/env luajit
local home = os.getenv("HOME")
local configfileread = io.open(home.."/.config/dedproton/default.cfg", "r")
local lines = {}
for line in configfileread:lines() do
    table.insert(lines,line)
end
local defaultval = lines[1]
local protonval = lines[2]

local function protonfind()
	local protons = io.open(home.."/.config/dedproton/protons", "r")
	local amount = 0
	local protonstwo = {}
	for eachproton in protons:lines() do
		amount=amount+1
		table.insert(protonstwo,eachproton)
		print(amount..": "..eachproton)
	end
	io.write("your choice:")
	if defaultval == "y" then
		io.write(protonval.."\n")
		return protonstwo[tonumber(protonval)]
	else
		local optionchoose = tonumber(io.read())
		return protonstwo[optionchoose]
	end
end

local argparse = require("argparse")
local parser = argparse("DED-proton", "DED-proton")
local tab = {' STEAM_COMPAT_CLIENT_INSTALL_PATH="'..home..'/.local/share/Steam" STEAM_COMPAT_DATA_PATH="'..home..'/.local/share/proton-pfx/0" MANGOHUD=1 PROTON_NO_WM_DECORATION=1 UMU_NO_RUNTIME=1 PROTON_PREFER_SDL_INPUT=1 '}

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

proton = protonfind()
configfileread:close()

if args.quiet == true then
    os.execute(table.concat(tab) .. 'gamemoderun ' .. proton .. ' run "' .. args.game ..
        '" >/tmp/proton-cachyos.log 2>&1')
else
    os.execute(table.concat(tab) .. 'gamemoderun ' .. proton .. ' run "' .. args.game .. '"')
end


