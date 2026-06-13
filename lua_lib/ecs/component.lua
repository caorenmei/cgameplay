--- ECS ComponentType
-- 组件类型定义，包含名称与可选默认值，用于创建组件实例。

---@class ComponentType
local ComponentType = {}
ComponentType.__index = ComponentType

---@param name string
---@param default? any
---@return ComponentType
function ComponentType.new(name, default)
    return setmetatable({ name = name, default = default }, ComponentType)
end

---@return any
function ComponentType:create()
    if type(self.default) == "table" then
        local copy = {}
        for k, v in pairs(self.default) do
            copy[k] = v
        end
        return copy
    end
    return self.default
end

return ComponentType
