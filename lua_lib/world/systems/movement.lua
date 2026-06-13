--- Movement System
-- 处理带有 Position 组件的实体的移动逻辑。

local System = require("ecs.system")

---@class MovementSystem : System
local MovementSystem = {}
MovementSystem.__index = MovementSystem
setmetatable(MovementSystem, { __index = System })

---@return MovementSystem
function MovementSystem.new()
    local self = setmetatable(System.new(), MovementSystem)
    ---@cast self MovementSystem
    return self
end

---@param world World
---@param dt number
function MovementSystem:update(world, dt)
    ---@diagnostic disable-next-line: unused-local
    local _world, _dt = world, dt
    -- TODO: 遍历具有 Position 组件的实体并更新位置
end

return MovementSystem
