function writingtest(filename)
    local file = io.open(filename, "w+")
    if file == nil then
        print("fuck you")
    else
        for i = 1, 10000000 do
            file:write(i .. " ")
            i = i + 1
        end
        file:close()
    end
end

function speedtest()
    i = 0
    while i < 10000000 do
        print(i)
        i = i + 1
    end
end

io.write("1 writingtest()" .. "\n" .. "2 speedtest" .. "\n")
while true do
    local read = tonumber(io.read("*l"))
    if read ~= nil then
        if read == 1 then
            writingtest("test.md")
            break
        elseif read == 2 then
            speedtest()
        end
    else
        print("write a number stupid")
        break
    end
end
