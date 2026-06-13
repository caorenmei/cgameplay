--- Combat System
-- 处理战斗、伤害与死亡判定。

local System = require("ecs.system")

---@class CombatSystem : System
local CombatSystem = {}
CombatSystem.__index = CombatSystem
setmetatable(CombatSystem, { __index = System })

---@return CombatSystem
function CombatSystem.new()
    local self = setmetatable(System.new(), CombatSystem)
    ---@cast self CombatSystem
    return self
end

---@param world World
---@param dt number
function CombatSystem:update(world, dt)
    ---@diagnostic disable-next-line: unused-local
    local _world, _dt = world, dt
    -- TODO: 处理 Health 组件相关逻辑
end

return CombatSystem
