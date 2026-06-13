--- Render System
-- 负责将游戏状态渲染为文本输出。

local System = require("ecs.system")

---@class RenderSystem : System
local RenderSystem = {}
RenderSystem.__index = RenderSystem
setmetatable(RenderSystem, { __index = System })

---@return RenderSystem
function RenderSystem.new()
    local self = setmetatable(System.new(), RenderSystem)
    ---@cast self RenderSystem
    return self
end

---@param world World
---@param dt number
function RenderSystem:update(world, dt)
    ---@diagnostic disable-next-line: unused-local
    local _world, _dt = world, dt
    -- TODO: 根据实体组件生成文本输出
end

return RenderSystem
