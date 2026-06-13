--- 测试环境初始化
-- 在 busted 加载测试前配置 package.path 与 package.cpath，
-- 确保测试可以 require 到 lua_lib/ 与 lua_modules/ 中的模块。

local source = debug.getinfo(1, "S").source
local root = source:match("^@(.+)/lua_tests/support/env%.lua$") or "."

package.path = table.concat({
    root .. "/lua_lib/?.lua",
    root .. "/lua_lib/?/init.lua",
    root .. "/lua_tools/?.lua",
    root .. "/lua/?/init.lua",
    root .. "/?.lua",
    package.path,
}, ";")

package.cpath = table.concat({
    root .. "/lua_modules/lib/lua/5.4/?.so",
    package.cpath,
}, ";")
