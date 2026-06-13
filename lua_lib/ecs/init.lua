--- ECS 核心框架入口
-- 暴露 World、Entity、ComponentType、System、Query 等基础 API。

local ecs = {}

ecs.World = require("ecs.world")
ecs.Entity = require("ecs.entity")
ecs.ComponentType = require("ecs.component")
ecs.System = require("ecs.system")
ecs.Query = require("ecs.query")

return ecs
