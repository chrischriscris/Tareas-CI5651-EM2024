local treap = {}

treap.__index = treap

function treap.new(value)
    local t = {}
    setmetatable(t, treap)

    t.value = value
    t.priority = math.random(0, 1000000)

    t.size = 1
    t.left = nil
    t.right = nil
    return t
end

local function size(t)
    if t == nil then
        return 0
    end
    return t.size
end

function treap:split(x)
    if self == nil then
        return nil, nil
    end

    if size(self.left) < x then
        local left, right = treap.split(self.right, x - size(self.left) - 1)
        self.right = left
        self.size = size(self.left) + size(self.right) + 1
        return self, right
    end

    local left, right = treap.split(self.left, x)
    self.left = right
    self.size = size(self.left) + size(self.right) + 1
    return left, self
end

return treap
