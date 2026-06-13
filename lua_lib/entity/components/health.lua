--- Health 组件
-- 表示实体的生命值与状态。

---@class Health
local Health = {}
Health.__index = Health

---@param current integer
---@param maximum integer
---@return Health
function Health.new(current, maximum)
    return setmetatable({
        current = current or 10,
        maximum = maximum or 10,
    }, Health)
end

return Health
