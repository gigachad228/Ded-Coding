#!/usr/bin/env luajit

-- STEP 1 - DEFINING!!!
local home = os.getenv("HOME")
local config = home.."/.config/dedlua/"
local share = home.."/.local/share/dedlua/"
package.path = share.."?.lua;"..home..".luarocks/share/lua/5.1/?.lua"
local version = "0.5.1"
local os = require("os")
local dedlib = require("dedlib")
local safeline=[[ \]].."\n"
local start = {}
local prestart = {}
local poststart = {}

function readfile(file,_table)
   local fileread = io.open(file, "r")
   if fileread == nil then
      dedlib.warn(file.." doesn't exist, not doing anything!")
      return ":"
   else
      for line in fileread:lines() do
	 table.insert(_table,line)
      end
   end
   fileread:close()
end

readfile(config.."env",start) -- INSERTING ENVIRONMENT VARIABLES FROM FILE
readfile(config.."pfx",start) -- INSERTING PREFIX FROM FILE

readfile(config.."prestart",prestart) -- INSERTING PRESTART COMMANDS
readfile(config.."poststart",poststart) -- INSERTING POSTSTART COMMANDS

local function protonfind()
   local values = {}
   readfile(config.."default.cfg",values) -- READING DEFAULT.CFG FILE
   local defaultval = values[1]
   local protonval = values[2]
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
   if defaultval == "y" then
      io.write(protonval.."\n")
      local proton = protonstwo[tonumber(protonval)]
      print("default is set to y, choosing "..proton)
      return proton
   else
      local choice = io.read()
      if tonumber(choice) > amount then
	 error(color.."NO SUCH CHOICE!!!"..reset)
      end
      local optionchoose = tonumber(choice)
      return protonstwo[optionchoose]
   end
end

local proton = protonfind()
-- STEP 2 - ARGUMENTING!!!
local argparse = require("argparse")
local parser = argparse("DED-proton", "DED-proton")

parser:flag "-W --wayland":description("set PROTON_ENABLE_WAYLAND to 1")
parser:flag "-B --vkbasalt":description("set ENABLE_VKBASALT to 1")
parser:flag "-q --quiet":description("don't output anything from proton and end variables"):count("0-2"):target("quietness")
parser:flag "-x --xim":description("set PROTON_NO_XIM to 0")
parser:flag "-v --version":description("print the version and exit the wrapper")
parser:argument("game", "the game itself")

local args = parser:parse()

if args.version == true then
   print("wrapper's version: "..version)
   os.exit()
end

if args.wayland == true then
   table.insert(start, "PROTON_ENABLE_WAYLAND=1")
end

if args.vkbasalt == true then
   table.insert(start, "ENABLE_VKBASALT=1")
end

if args.xim == true then
   table.insert(start, "PROTON_NO_XIM=0")
end

-- STEP 3 - LAUNCHING!!!
local prestartcommand = table.concat(prestart,safeline)
local command = table.concat(start,safeline)..safeline..'"'..proton..'"'..' run "'..args.game..'"'
local poststartcommand = table.concat(poststart,safeline)
if args.quietness == 1 then
   local command = command.." >/tmp/dedlua.log 2>&1"
   print(prestartcommand..";"..command..";"..poststartcommand)
   os.execute(prestartcommand)
   os.execute(command)
   os.execute(poststartcommand)
elseif args.quietness >= 2 then
   local command = command.." >/tmp/dedlua.log 2>&1"
   os.execute(prestartcommand)
   os.execute(command)
   os.execute(poststartcommand)
else
   print(prestartcommand..";"..command..";"..poststartcommand)
   os.execute(prestartcommand)
   os.execute(command)
   os.execute(poststartcommand)
end
