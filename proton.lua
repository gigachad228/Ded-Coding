#!/usr/bin/env luajit

-- STEP 1 - DEFINING!!!
local os = require("os")
local home = os.getenv("HOME")
package.path = home.."/.local/share/dedproton/?.lua"
local fileread = io.open(home.."/.config/dedproton/default.cfg", "r")
local values = {}
for line in fileread:lines() do
    table.insert(values,line)
end
fileread:close()
local defaultval = values[1]
local protonval = values[2]
local tab = {'STEAM_COMPAT_CLIENT_INSTALL_PATH="'..home..'/.local/share/Steam"', 'STEAM_COMPAT_DATA_PATH="'..home..'/.local/share/proton-pfx/0"'}

local function protonfind()
	local protons = io.open(home.."/.config/dedproton/protons", "r")
	local amount = 0
	local protonstwo = {}
	for eachproton in protons:lines() do
		amount=amount+1
		table.insert(protonstwo,eachproton)
		print(amount..": "..eachproton)
	end
	protons:close()
	io.write("your choice:")
	if defaultval == "y" then
		io.write(protonval.."\n")
		return protonstwo[tonumber(protonval)]
	else
		local optionchoose = tonumber(io.read())
		return protonstwo[optionchoose]
	end
end

local proton = protonfind()

-- STEP 2 - ARGUMENTING!!!
local argparse = require("argparse")
local parser = argparse("DED-proton", "DED-proton")

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

fileread = io.open(home.."/.config/dedproton/env", "r")
for line in fileread:lines() do
	table.insert(tab,line)
end
fileread:close()

-- STEP 3 - LAUNCHING!!!
if args.quiet == true then
    os.execute(table.concat(tab, " ").." "..proton..' run "'..args.game..'" >/tmp/dedproton.log 2>&1')
else
    os.execute(table.concat(tab, " ").." "..proton..' run "'..args.game..'"')
end
