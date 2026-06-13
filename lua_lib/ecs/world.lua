--- ECS World
-- 管理所有实体、组件池和系统的运行中心。

---@class World
local World = {}
World.__index = World

---@return World
function World.new()
    local self = setmetatable({}, World)
    self.next_entity_id = 1
    self.entities = {}
    self.components = {}
    self.systems = {}
    return self
end

---@return integer entity_id
function World:create_entity()
    local id = self.next_entity_id
    self.next_entity_id = id + 1
    self.entities[id] = true
    return id
end

---@param entity_id integer
function World:destroy_entity(entity_id)
    self.entities[entity_id] = nil
    for _, storage in pairs(self.components) do
        storage[entity_id] = nil
    end
end

---@param name string
function World:register_component(name)
    if not self.components[name] then
        self.components[name] = {}
    end
end

---@param entity_id integer
---@param name string
---@param data any
function World:set_component(entity_id, name, data)
    self:register_component(name)
    self.components[name][entity_id] = data
end

---@param entity_id integer
---@param name string
---@return any
function World:get_component(entity_id, name)
    local storage = self.components[name]
    return storage and storage[entity_id]
end

---@param entity_id integer
---@param name string
function World:remove_component(entity_id, name)
    local storage = self.components[name]
    if storage then
        storage[entity_id] = nil
    end
end

---@param entity_id integer
---@param name string
---@return boolean
function World:has_component(entity_id, name)
    local storage = self.components[name]
    return storage ~= nil and storage[entity_id] ~= nil
end

---@param system System
function World:add_system(system)
    table.insert(self.systems, system)
end

---@param dt number
function World:update(dt)
    for _, system in ipairs(self.systems) do
        system:update(self, dt)
    end
end

return World
