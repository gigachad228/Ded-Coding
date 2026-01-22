math.randomseed(os.time())
--local rand = require("./ownlibs/rand")
local filelocation = "/tmp/luatest.txt"
local file = io.open(filelocation,"w+")
local amount = 15000000
function writingtest()
    for i = 1, amount, 1 do
        file:write(i .. "#")
    end
    file:close()
end

function speedtest()
    for i=1,amount,1 do
        print(i)
    end
end

--[[function speedtesttest()
    local _table = {}
    for i=1,amount,1 do
        table.insert(_table,i.."\n")
    end
    print(table.concat(_table))
end]]

function randseq(x)
    local fucker={}
    for i=33,126 do table.insert(fucker,string.char(i)) end
    if rand == true then
       for i=1,x,1 do
	  file:write(fucker[require("rand").random_range(1, #fucker)])
       end
    else
       for i=1,x,1 do
	  file:write(fucker[math.random(#fucker)])
       end
    end
end

function randseqprint(x)
   local fucker={}
   local output={}
   for i=33,126 do table.insert(fucker,string.char(i)) end
   if rand == true then
      for i=1,x,1 do
	 io.write(fucker[require("rand").random_range(1, #fucker)])
      end
   else
      for i=1,x,1 do
	 io.write(fucker[math.random(#fucker)])
      end
   end
end

io.write('1: writingtest() -- '..amount..'numbers written into '..filelocation.."\n"..'2: speedtest() -- '..amount..' numbers printed out'.."\n"..'3: randseq() -- '..amount..' random characters written into '..filelocation.."\n"..'4: randseqprint() -- '..amount..' random characters written into stdout '.."\n"..'Your choice:')

while true do
    local read = tonumber(io.read("*l"))
    if read ~= nil then
        if read == 1 then
            writingtest()
            break
        elseif read == 2 then
            speedtest()
            break
        elseif read == 3 then
	    randseq(amount)
            break
        elseif read == 4 then
            randseqprint(amount)
	    break
        end
	file:close()
    else
        print("write a number stupid")
    end
end
