# Simple Progress Bar (spb)

Just a small library for those who don't know how to make a progress bar in their code, it's fully customizable!

1. spb.simplebar(char(string),len(number),step(number),blankchar(string),start(number)) - this function should give you an idea on how to make a basic forloop bar

char=character that is used to make a single step. If not stated uses "#"

len=length of the bar. If not stated uses 50

step=how much to step. If bigger than length of the bar then use default number, which is 1

blankchar=character that is used to fill the rest of the bar. If not stated uses "-"

start=from where to start in the progress bar. If bigger then length of the bar uses default number, which is 0

2. spb.bar(char(string),len(number),blankchar(string),progress(number))

All the same except it's not a loop anymore, it's a bar for your progress.

progress=percentage of how much "char" has occupied the bar at the moment, should be fairly simple to use, for example:

```
local spb = require("spb") -- the library itself, duh
local length=150000 -- length of the loop
local barlength=75 -- length of the bar
for i=0,length,1 do
   io.write("\r"..spb.bar("#",barlength,"-",math.floor((i/length)*barlength))) -- "\r" is a return to the start of the line
   -- it let's you overwrite already existing stuff, perfect for loops and shit that needs it.
end
```