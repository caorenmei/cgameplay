--- Position 组件
-- 表示实体在游戏世界中的位置。

---@class Position
local Position = {}
Position.__index = Position

---@param x integer
---@param y integer
---@return Position
function Position.new(x, y)
    return setmetatable({ x = x or 0, y = y or 0 }, Position)
end

return Position
