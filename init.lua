-- 入口文件（Lua版本）

-- 加载基础配置
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.functions")

-- 加载插件管理器
require("core.lazy")
