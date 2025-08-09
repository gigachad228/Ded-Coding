local rand = require("./ownlibs/rand")
local file = io.open("luatest.txt","w+")
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

function speedtesttest()
    local _table = {}
    for i=1,amount,1 do
        table.insert(_table,i.."\n")
    end
    print(table.concat(_table))
end

function randseq()
local fucker = {'a','b','c','d','e','f','g','h','s','k','l','p','o','i','u','y','t','r','w','q','j','z','x','v','n','m','1','2','3','4','5','6','7','8','9','0'}
for i=1,amount,1 do
    file:write(fucker[rand.random_range(1,#fucker)])
end
end

io.write([[1 writingtest() -- ]]..amount..[[ numbers written into test.md
2 speedtest() -- ]]..amount..[[ numbers printed out
3 randseq() -- ]]..amount..[[ random characters written into test.md
Your choice: ]])

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
            speedtesttest()
            break
        end
    else
        print("write a number stupid")
    end
end
