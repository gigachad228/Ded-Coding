--[[
   This is a proof of concept of a forloop progress bar that outputs a cool progress bar
   with big numbers over the progress bar and a completion time. That's it.
]]

local start = os.time()
local function bar(char,len,blankchar,progress)
   blankprogress=len-progress
   return "\r["..string.rep(char,progress)..string.rep(blankchar,blankprogress).."]\n"
end
local length=15000000
local barlength=50
local amount_of_N=2
for i=0,length,1 do
   -- Count how much "\n"'s you have in your outputs and type it into the amount_of_N above
   -- Yeah, manually, sadly, though i'll try to learn in the future how to make it automatic
   io.write(i.."\n"..bar("#",barlength,"-",math.floor((i/length)*barlength)).."\27["..amount_of_N.."A\27[2K")
end
local finish = os.time()
print("done in "..finish-start.." seconds")
