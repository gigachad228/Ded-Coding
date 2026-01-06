local libshit = {}
function libshit.warn(text)
   local color = "\27[33m"
   local reset = "\27[0m"
   io.write(color..text..reset.."\n")
end
return libshit
