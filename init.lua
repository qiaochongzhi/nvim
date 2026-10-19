-- 入口文件（Lua版本）

-- 加载基础配置
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.functions")

-- 本机环境探测（Python provider / PDF 阅读器）
require("core.env")

-- 加载插件管理器
require("core.lazy")
