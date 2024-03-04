#!/usr/bin/env luajit

local t = require("src.treap").create(1)

local n = tonumber(arg[1])

for i = 2, n do
    t = t:push_back(i)
end

-- Read the file in arg[2] in the format "a b"
local f = io.open(arg[2], "r")
local swaps = {}

if f then
    for line in f:lines() do
        local a, b = line:match("(%d+) (%d+)")
        table.insert(swaps, { tonumber(a), tonumber(b) })
    end
    f:close()
end

local ms = require("src.multiswap")

for _, swap in ipairs(swaps) do
    t = ms.multiswap(t, swap[1], swap[2])
end

if t then
    t:print()
end
