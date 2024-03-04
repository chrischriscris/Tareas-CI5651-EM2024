local treap = require("src.treap")
local multiswap = {}

function multiswap.multiswap(t, a, b)
    if t == nil then
        return nil
    end

    local n = t.size

    if b - a <= n - b + 1 then
        local subarr1, rest1 = t:split(a - 1)
        local subarr2, rest2 = rest1:split(b - a)
        local subarr3, subarr4 = rest2:split(b - a)

        local new = treap.merge(subarr1, subarr3)
        new = treap.merge(new, subarr2)

        return treap.merge(new, subarr4)
    end

    local subarr1, rest1 = t:split(a - 1)
    local subarr2, rest2 = rest1:split(n - b + 1)
    local subarr3, subarr4 = rest2:split(2 * b - n - a - 1)

    local new = treap.merge(subarr1, subarr4)
    new = treap.merge(new, subarr3)

    return treap.merge(new, subarr2)
end

return multiswap
