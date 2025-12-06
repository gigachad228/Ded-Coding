#!/usr/bin/env luajit
local home = os.getenv("HOME")
local wallpaper = "~/Pictures/wallpapers/wallpaper"
package.path = home.."/.local/share/dedlua/?.lua"
local rand = require("rand")
local wallpapers = {
    wallpaper.."1.png",
    wallpaper.."2.png",
    wallpaper.."3.png",
    wallpaper.."4.png",
    wallpaper.."5.png",
    wallpaper.."6.png",
    wallpaper.."7.png",
    wallpaper.."8.png"
--    wallpaper.."9.png"
}
if rand ~= nil then
    math.randomseed(rand.random_range(rand.random_range(1,8000),rand.random_range(1,8000)))
else
    math.randomseed(os.time())
end
local random = math.random(#wallpapers)
os.execute("pkill swaybg;swaybg -i "..wallpapers[random])
