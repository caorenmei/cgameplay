--- Inventory 组件
-- 表示实体携带的物品列表。

---@class Inventory
local Inventory = {}
Inventory.__index = Inventory

---@return Inventory
function Inventory.new()
    return setmetatable({ items = {} }, Inventory)
end

return Inventory
