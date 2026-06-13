--- ECS System 基类
-- 系统负责处理具备特定组件组合的实体，每帧执行逻辑。

---@class System
local System = {}
System.__index = System

---@return System
function System.new()
    return setmetatable({}, System)
end

---@param world World
---@param dt number
function System:update(world, dt)
    ---@diagnostic disable-next-line: unused-local
    local _world, _dt = world, dt
end

return System
