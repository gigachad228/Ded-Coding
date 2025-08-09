local rand = {}
local ffi = require("ffi")
ffi.cdef [[
    int open(const char *pathname, int flags);
    ssize_t read(int fd, void *buf, size_t count);
    int close(int fd);
]]
function rand.random_range(min, max)
    local fd = ffi.C.open("/dev/urandom", 0)
    if fd == -1 then
        error("Не удалось открыть /dev/urandom")
    end
    local buf = ffi.new("uint32_t[1]")
    ffi.C.read(fd, buf, 4)
    ffi.C.close(fd)
    local num = tonumber(buf[0])
    local normalized = num / 4294967296.0
    return min + math.floor(normalized * (max - min + 1))
end
--CAN ONLY BE USED WITH LUAJIT!!!!
return rand
