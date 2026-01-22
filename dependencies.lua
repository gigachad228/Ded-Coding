#!/usr/bin/lua
local dependencies = {
   "argparse",
   "luasocket"
}
function luajitinstall(dep)
   for i in pairs(dep) do
      print("installing "..dep[i].." for luajit")
      os.execute("luarocks install --local --lua-version=5.1 "..dep[i])
   end
end
function luainstall(dep)
   for i in pairs(dep) do
      print("installing "..dep[i])
      os.execute("luarocks install --local "..dep[i])
   end
end
luajitinstall(dependencies)
luainstall(dependencies)
