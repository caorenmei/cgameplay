# 项目目录结构与功能模块

> **版本**: 0.1.0  > **适用范围**: `cgameplay` 文本游戏项目  
> **架构**: ECS（Entity-Component-System），按功能域分布

---

## 顶层目录树

```
cgameplay/
├── docs/                       # 项目文档
│   ├── books/                  # 第三方库中文文档
│   │   └── LuaCATS-annotations.md
│   └── specs/                  # 功能规格说明
│       └── project-structure.md
├── lua_lib/                    # 核心库代码，按 ECS + 功能域组织
│   ├── init.lua                # 顶层包入口
│   ├── ecs/                    # ECS 核心框架
│   │   ├── init.lua
│   │   ├── world.lua           # ECS World：实体、组件、系统管理
│   │   ├── entity.lua          # 实体 ID 管理
│   │   ├── component.lua       # ComponentType 定义
│   │   ├── system.lua          # System 基类与调度
│   │   └── query.lua           # 实体查询工具
│   ├── game/                   # 游戏专属逻辑
│   │   ├── init.lua
│   │   └── world_builder.lua   # 世界构建器
│   ├── world/                  # 世界与场景域
│   │   ├── init.lua
│   │   ├── components/         # 世界相关组件
│   │   │   └── position.lua
│   │   └── systems/            # 世界相关系统
│   │       └── movement.lua
│   ├── entity/                 # 实体域
│   │   ├── init.lua
│   │   ├── components/         # 实体相关组件
│   │   │   ├── health.lua
│   │   │   └── inventory.lua
│   │   └── systems/            # 实体相关系统
│   │       └── combat.lua
│   ├── action/                 # 动作与命令域
│   │   ├── init.lua
│   │   ├── components/         # 命令相关组件
│   │   └── systems/            # 动作执行系统
│   ├── story/                  # 叙事域
│   │   ├── init.lua
│   │   ├── components/         # 任务/事件组件
│   │   └── systems/            # 叙事推进系统
│   ├── io/                     # 输入输出域
│   │   ├── init.lua
│   │   ├── components/         # 渲染状态组件
│   │   └── systems/            # 输入/渲染系统
│   │       ├── input.lua
│   │       └── render.lua
│   ├── persist/                # 持久化
│   │   └── init.lua
│   └── util/                   # 通用工具
│       └── init.lua
├── lua_metas/                  # LuaCATS 类型定义
│   └── cgameplay.lua
├── lua_tests/                  # 测试代码
│   ├── support/
│   │   └── env.lua             # 测试环境初始化
│   ├── ecs_spec.lua
│   ├── game_spec.lua
│   ├── world_spec.lua
│   ├── entity_spec.lua
│   ├── action_spec.lua
│   ├── story_spec.lua
│   ├── io_spec.lua
│   ├── persist_spec.lua
│   └── util_spec.lua
├── lua_tools/                  # Lua 工具脚本
│   └── README.md
├── AGENTS.md                   # 项目开发规范
├── CLAUDE.md                   # Claude 开发指令
├── cgameplay-0.1.0-1.rockspec  # LuaRocks 包配置
├── .luarc.json                 # LuaLS 配置
├── lua                         # 便利脚本：Lua REPL
└── luarocks                    # 便利脚本：LuaRocks 本地管理
```

---

## ECS 架构说明

本项目采用 **Entity-Component-System（ECS）** 架构，但组件与系统按功能域分布：

- **Entity（实体）**：仅作为唯一标识符（ID），不携带数据与行为。
- **Component（组件）**：纯数据结构，按功能域分散在 `world/components/`、`entity/components/`、`action/components/` 等目录中。
- **System（系统）**：处理逻辑，按功能域分散在 `world/systems/`、`entity/systems/`、`io/systems/` 等目录中。
- **World（世界）**：`lua_lib/ecs/world.lua` 统一管理中心。

---

## 目录职责

| 目录 | 职责 |
|------|------|
| `docs/` | 项目文档与参考资料。`books/` 放第三方文档中文译本；`specs/` 放功能规格、设计文档。 |
| `lua_lib/ecs/` | ECS 核心框架：World、Entity、ComponentType、System、Query。 |
| `lua_lib/game/` | 游戏专属逻辑，如世界构建器、规则配置、剧情装配。 |
| `lua_lib/world/` | 世界与场景域：位置、场景/房间组件及导航系统。 |
| `lua_lib/entity/` | 实体域：玩家、NPC、物品相关的组件与系统。 |
| `lua_lib/action/` | 动作与命令域：命令解析、动作执行。 |
| `lua_lib/story/` | 叙事域：事件、任务、剧情分支。 |
| `lua_lib/io/` | 输入输出域：输入处理、文本格式化与渲染。 |
| `lua_lib/persist/` | 持久化：序列化、存档/读档、数据迁移。 |
| `lua_lib/util/` | 通用工具函数。 |
| `lua_metas/` | LuaCATS 类型定义文件，不参与运行时。 |
| `lua_tests/` | 单元测试，使用 **busted** 框架，文件统一以 `*_spec.lua` 命名。 |
| `lua_tools/` | 独立开发工具脚本。 |

---

## 模块说明

### `lua_lib/ecs/` — ECS 核心框架

| 文件 | 职责 |
|------|------|
| `init.lua` | 暴露 `World`、`Entity`、`ComponentType`、`System`、`Query` 等核心 API |
| `world.lua` | ECS World：实体 ID 管理、组件注册/设置/获取/移除、系统列表、`update(dt)` 驱动入口 |
| `entity.lua` | 实体 ID 相关便捷接口 |
| `component.lua` | `ComponentType` 组件类型定义与默认实例创建 |
| `system.lua` | System 基类，所有系统继承此类 |
| `query.lua` | 根据组件组合查询实体 ID 列表 |

### `lua_lib/game/` — 游戏专属逻辑

| 文件 | 职责 |
|------|------|
| `world_builder.lua` | 根据数据装配 ECS World：注册组件、创建实体、添加系统 |

### `lua_lib/world/` — 世界与场景域

| 路径 | 职责 |
|------|------|
| `components/position.lua` | 位置坐标 `(x, y)` |
| `systems/movement.lua` | 处理 `Position` 组件的移动逻辑 |

### `lua_lib/entity/` — 实体域

| 路径 | 职责 |
|------|------|
| `components/health.lua` | 生命值 `(current, maximum)` |
| `components/inventory.lua` | 物品列表 |
| `systems/combat.lua` | 处理 `Health` 组件的战斗逻辑 |

### `lua_lib/action/` — 动作与命令域

| 路径 | 职责 |
|------|------|
| `components/` | 命令/意图组件 |
| `systems/` | 动作解析与执行系统 |

### `lua_lib/story/` — 叙事域

| 路径 | 职责 |
|------|------|
| `components/` | 任务、事件组件 |
| `systems/` | 叙事推进与触发系统 |

### `lua_lib/io/` — 输入输出域

| 路径 | 职责 |
|------|------|
| `systems/input.lua` | 读取玩家输入 |
| `systems/render.lua` | 根据组件状态生成文本输出 |

### `lua_lib/persist/` — 持久化

- 游戏状态序列化
- 存档/读档接口
- 数据版本迁移

### `lua_lib/util/` — 通用工具

- 字符串辅助函数
- 表（table）扩展
- 验证器、枚举辅助等

---

## 测试组织

`lua_tests/` 目录与 `lua_lib/` 的功能域一一对应：

```
lua_tests/
├── support/env.lua
├── ecs_spec.lua           -- 对应 lua_lib/ecs/
├── game_spec.lua          -- 对应 lua_lib/game/
├── world_spec.lua         -- 对应 lua_lib/world/
├── entity_spec.lua        -- 对应 lua_lib/entity/
├── action_spec.lua        -- 对应 lua_lib/action/
├── story_spec.lua         -- 对应 lua_lib/story/
├── io_spec.lua            -- 对应 lua_lib/io/
├── persist_spec.lua       -- 对应 lua_lib/persist/
└── util_spec.lua          -- 对应 lua_lib/util/
```

- `support/env.lua` 负责初始化测试环境（设置 `package.path`、`package.cpath`）。
- 运行测试：`busted --helper=lua_tests/support/env.lua lua_tests/`

---

## 类型定义

`lua_metas/` 下放置 LuaCATS 注解文件，为 `lua_lib/` 中的模块提供类型声明。典型文件：

- `lua_metas/cgameplay.lua` — 公共类型（`World`、`System`、`Entity`、`ComponentType`、`Position`、`Health`、`Inventory` 等）

这些文件使用 `@meta` 标记，不参与运行时 `require`。

---

## 工具脚本

`lua_tools/` 用于存放开发期独立脚本，例如：

- `validate_world.lua` — 校验世界数据合法性
- `build_map.lua` — 从数据文件生成世界图

工具脚本可直接通过 `./lua lua_tools/<script>.lua` 运行。

---

## 相关配置

- **`.luarc.json`**: 配置 Lua 5.4 运行时、`lua_lib/` 模块搜索路径、`lua_modules/` 库路径及诊断规则。
- **`cgameplay-0.1.0-1.rockspec`**: LuaRocks 包配置，声明 Lua 5.4 依赖、`busted` 测试依赖，并复制 `docs/` 目录。
- **便利脚本**:
  - `./lua` — 启动带本地依赖路径的 Lua 5.4 REPL
  - `./luarocks` — 使用本地 `lua_modules/` 管理 LuaRocks 依赖
