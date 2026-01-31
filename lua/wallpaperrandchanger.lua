#!/usr/bin/env luajit
local numofwallpapers=11
local home = os.getenv("HOME")
local wallpaper = "~/Pictures/wallpapers/wallpaper"
package.path = home.."/.local/share/dedlua/?.lua"
local rand = require("rand")
local wallpapers = {}
for i=1, numofwallpapers do
     table.insert(wallpapers,wallpaper..i..".png")
end
print("your wallpapers are:".."\n"..table.concat(wallpapers,"\n"))
if rand ~= nil then
    math.randomseed(rand.random_range(rand.random_range(1,8000),rand.random_range(1,8000)))
else
    math.randomseed(os.time())
end
local random = math.random(#wallpapers)
print(random)
os.execute("pkill swaybg;swaybg -i "..wallpapers[random])
