--- ECS Entity 管理
-- 实体在 ECS 中仅为唯一标识符（ID），本模块提供创建/销毁实体的便捷接口。

local Entity = {}

---@return integer id
function Entity.next_id()
    -- 实际 ID 生成由 World 负责，此处仅作概念占位。
    return 0
end

return Entity
