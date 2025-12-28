#!/usr/bin/env luajit

-- STEP 1 - DEFINING!!!
local version = "0.5.0"
local os = require("os")
local home = os.getenv("HOME")
package.path = home.."/.local/share/dedlua/?.lua"
local fileread = io.open(home.."/.config/dedlua/default.cfg", "r")
local values = {}
for line in fileread:lines() do
    table.insert(values,line)
end
fileread:close()
local defaultval = values[1]
local protonval = values[2]
local tab = {}

local function protonfind()
	local color = "\27[31m"
	local reset = "\27[0m"
	local protons = io.open(home.."/.local/share/dedlua/protons", "r")
	if protons == nil then
		error(color..home..'/.local/share/dedlua/protons NOT FOUND, ABORTING!!! PLEASE LAUNCH "forlua.sh"'..reset)
	end
	local amount = 0
	local protonstwo = {}
	for eachproton in protons:lines() do
		amount=amount+1
		table.insert(protonstwo,eachproton)
		print(amount..": "..eachproton)
	end
	protons:close()
	io.write("your choice:")
	local choice = io.read()
	if tonumber(choice) > amount then
		error(color.."NO SUCH CHOICE!!!"..reset)
	end
	if defaultval == "y" then
		io.write(protonval.."\n")
		return protonstwo[tonumber(protonval)]
	else
		local optionchoose = tonumber(choice)
		return protonstwo[optionchoose]
	end
end

-- STEP 2 - ARGUMENTING!!!
local argparse = require("argparse")
local parser = argparse("DED-proton", "DED-proton")

parser:flag "-W --wayland":description("set PROTON_ENABLE_WAYLAND to 1")
parser:flag "-B --vkbasalt":description("set ENABLE_VKBASALT to 1")
parser:flag "-q --quiet":description("don't output anything from proton and end variables"):count("0-2"):target("quietness")
parser:flag "-x --xim":description("set PROTON_NO_XIM to 0")
parser:flag "-v --version":description("print the version and exit the wrapper")
parser:flag "-"
parser:argument("game", "the game itself")

local args = parser:parse()

if args.version == true then
	print("wrapper's version: "..version)
	os.exit()
end

if args.wayland == true then
    table.insert(tab, "PROTON_ENABLE_WAYLAND=1")
end

if args.vkbasalt == true then
    table.insert(tab, "ENABLE_VKBASALT=1")
end

if args.xim == true then
    table.insert(tab, "PROTON_NO_XIM=0")
end

local proton = protonfind()

fileread = io.open(home.."/.config/dedlua/env", "r") -- INSERTING ENV FROM FILE
for line in fileread:lines() do
	table.insert(tab,line)
end
fileread:close()
fileread = io.open(home.."/.config/dedlua/pfx", "r") -- INSERTING PFX FROM FILE
for line in fileread:lines() do
	table.insert(tab,line)
end
fileread:close()
-- STEP 3 - LAUNCHING!!!
local command = table.concat(tab, [[ \]].."\n").." "..'"'..proton..'"'..' run "'..args.game..'"'
if args.quietness == 1 then
    local command = command.." >/tmp/dedlua.log 2>&1"
    print(command)
    os.execute(command)
elseif args.quietness >= 2 then
    local command = command.." >/tmp/dedlua.log 2>&1"
    os.execute(command)
else
    print(command)
    os.execute(command)
end
