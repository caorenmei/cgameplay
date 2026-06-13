--- 游戏世界构建器
-- 负责根据数据构建 ECS 世界。

local World = require("ecs.world")

local M = {}

---@return World
function M.build()
    local world = World.new()
    -- TODO: 注册组件、创建实体、添加系统
    return world
end

return M
