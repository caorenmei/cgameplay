--- Input System
-- 读取玩家输入并转换为游戏动作。

local System = require("ecs.system")

---@class InputSystem : System
local InputSystem = {}
InputSystem.__index = InputSystem
setmetatable(InputSystem, { __index = System })

---@return InputSystem
function InputSystem.new()
    local self = setmetatable(System.new(), InputSystem)
    ---@cast self InputSystem
    return self
end

---@param world World
---@param dt number
function InputSystem:update(world, dt)
    ---@diagnostic disable-next-line: unused-local
    local _world, _dt = world, dt
    -- TODO: 读取输入并触发相应动作
end

return InputSystem
