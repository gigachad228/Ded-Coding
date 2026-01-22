local simpleprogressbar = {}

function simpleprogressbar.bar(char,len,step,blankchar,start)
   if char == nil then
      char="#"
   end
   if type(len) ~= "number" then
      len=50
   end
   if type(step) ~= "number" or step <= 0 then
      step=1
   end
   if blankchar == nil then
      blankchar="-"
   end
   if type(start) ~= nil or start > len then
      start=0
   end
   
   for progress=tonumber(start),len,step do
      io.write("\r["..string.rep(char,progress)..string.rep(blankchar,len-progress).."]")
   end
   io.write("\n")
end

return simpleprogressbar
