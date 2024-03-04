local t = require("treap").create(1)

local n = tonumber(arg[1])

for i = 2, n do
    t = t:push_back(i)
end

local ms = require("multiswap")

local result = ms.multiswap(t, 120, 2500)
result:print()
