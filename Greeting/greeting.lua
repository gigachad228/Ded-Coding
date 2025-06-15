local start = require("mainmod")
print([[1. sinstart()
2. ricing()]])
local func = io.read("*n")
if func == 1 then
start.sinstart()
elseif func == 2 then
start.rice()
elseif func > 2 then
start.sex()
end
