local socket = require("socket")
-- Пример: ASCII-график функции sin(x)
local DOSMTH = {}
function DOSMTH.sinstart()
for x = 0, 6, 0.2 do
    local y = math.sin(x) * 25 + 100
    local color = "\27[31m"
    local reset = "\27[0m"
    print("##"..string.rep("/", y)..color..string.rep([[/\]], 3)..reset..string.rep([[\]], 201-y).."###")
    end
end
function DOSMTH.rice()
local x = 1
local start_time = socket.gettime()
while x > 0 do
    local y = math.sin(x) * 25 + 100
    local color = "\27[31m"
    local reset = "\27[0m"
    x = x + 0.1
    
    -- Неблокирующая задержка (можно прервать Ctrl+C)
    while socket.gettime() - start_time < 0.03 do end
    start_time = socket.gettime()
    print("###"..string.rep("/", y)..color..string.rep([[/\]], 3)..reset..string.rep([[\]],201-y).."###")
end
end
function DOSMTH.sex()
         os.execute("reset")
         os.execute("clear")
         print('cute + funny = cunny')
         print([[

           FISHKISSFISHKIS               
       SFISHKISSFISHKISSFISH            F
    ISHK   ISSFISHKISSFISHKISS         FI
  SHKISS   FISHKISSFISHKISSFISS       FIS
HKISSFISHKISSFISHKISSFISHKISSFISH    KISS
  FISHKISSFISHKISSFISHKISSFISHKISS  FISHK
      SSFISHKISSFISHKISSFISHKISSFISHKISSF
  ISHKISSFISHKISSFISHKISSFISHKISSF  ISHKI
SSFISHKISSFISHKISSFISHKISSFISHKIS    SFIS
  HKISSFISHKISSFISHKISSFISHKISS       FIS
    HKISSFISHKISSFISHKISSFISHK         IS
       SFISHKISSFISHKISSFISH            K
         ISSFISHKISSFISHK               ]])
end
return DOSMTH
