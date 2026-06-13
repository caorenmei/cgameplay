---@meta

--- 项目级公共类型定义（ECS 架构）
-- 本文件仅用于 LuaLS 类型检查，不参与运行时逻辑。

---@class World
---@field next_entity_id integer
---@field entities table<integer, boolean>
---@field components table<string, table<integer, any>>
---@field systems System[]
---@field create_entity fun(self: World): integer
---@field destroy_entity fun(self: World, entity_id: integer)
---@field register_component fun(self: World, name: string)
---@field set_component fun(self: World, entity_id: integer, name: string, data: any)
---@field get_component fun(self: World, entity_id: integer, name: string): any
---@field remove_component fun(self: World, entity_id: integer, name: string)
---@field has_component fun(self: World, entity_id: integer, name: string): boolean
---@field add_system fun(self: World, system: System)
---@field update fun(self: World, dt: number)

---@class System
---@field update fun(self: System, world: World, dt: number)

---@class Entity
---@field id integer

---@class ComponentType
---@field name string
---@field default any
---@field new fun(name: string, default?: any): ComponentType
---@field create fun(self: ComponentType): any

---@class Position
---@field x integer
---@field y integer

---@class Health
---@field current integer
---@field maximum integer

---@class Inventory
---@field items table<integer, any>
