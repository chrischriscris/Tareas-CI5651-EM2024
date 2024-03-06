local treap = {}

treap.__index = treap

function treap.create(value)
    local t = {}
    setmetatable(t, treap)

    t.value = value
    t.priority = math.random(0, 1000000)

    t.size = 1
    t.left = nil
    t.right = nil
    return t
end

-- Returns the implicit index of the treap
local function size(t)
    if t == nil then
        return 0
    end

    return t.size
end

-- Returns L, R where L is the treap with the first x elements and R is the
-- treap with the rest
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

-- Merges two treaps
function treap.merge(t1, t2)
    if t1 == nil then
        return t2
    end

    if t2 == nil then
        return t1
    end

    if t1.priority > t2.priority then
        t1.right = treap.merge(t1.right, t2)
        t1.size = size(t1.left) + size(t1.right) + 1
        return t1
    end

    t2.left = treap.merge(t1, t2.left)
    t2.size = size(t2.left) + size(t2.right) + 1
    return t2
end

-- Inserts a new node with value after the index x
-- The leftmost node has index 1
function treap:insert(x, value)
    local new_node = treap.create(value)
    local left, right = self:split(x)

    return treap.merge(treap.merge(left, new_node), right)
end

function treap:push_back(value)
    return self:insert(size(self) + 1, value)
end

-- Walks the treap in in-order and prints the values
function treap:print()
    treap.print_rec(self)
    print()
end

function treap:print_rec()
    if self == nil then
        return
    end

    treap.print_rec(self.left)
    io.write(self.value, " ")
    treap.print_rec(self.right)
end

return treap
