# lua_tools

本目录存放 `cgameplay` 项目的独立开发工具脚本。

## 工具列表

| 脚本 | 用途 |
|------|------|
| `validate_world.lua` | （占位）校验世界数据文件合法性 |

## 运行方式

使用项目 REPL 脚本运行：

```bash
./lua lua_tools/validate_world.lua
```

或使用系统 Lua 5.4（确保 `lua_modules/` 路径已加入 `package.path`）：

```bash
lua5.4 lua_tools/validate_world.lua
```
