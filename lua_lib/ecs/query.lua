--- ECS Query 工具
-- 用于从 World 中查询具备指定组件组合的实体。

local Query = {}

---@param world World
---@param ... string 组件名称列表
---@return integer[] entity_ids
function Query.match(world, ...)
    local names = { ... }
    if #names == 0 then
        return {}
    end

    local first_storage = world.components[names[1]]
    if not first_storage then
        return {}
    end

    local result = {}
    for entity_id, _ in pairs(first_storage) do
        local matched = true
        for i = 2, #names do
            if not world:has_component(entity_id, names[i]) then
                matched = false
                break
            end
        end
        if matched then
            table.insert(result, entity_id)
        end
    end
    return result
end

return Query
