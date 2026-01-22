local simpleprogressbar = {}

function simpleprogressbar.bar(char,len,step,blankchar,start)
   if char == nil then
      char="#"
   end
   if type(len) ~= "number" then
      len=50
   end
   if type(step) ~= "number" then
      step=1
   end
   if blankchar == nil then
      blankchar="-"
   end
   if type(start) ~= nil or start > len then
      start=0
   end
   
   for progress=tonumber(start),len,step do
      io.write("\r["..string.rep(char,progress)..string.rep(blankchar,len-progress).."]".."\n")
   end
end

return simpleprogressbar
