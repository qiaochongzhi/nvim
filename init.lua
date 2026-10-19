-- 入口文件（Lua版本）

-- 加载基础配置
require("core.options")
require("core.keymaps")
require("core.autocmds")
require("core.functions")

-- 本机专属覆盖（可选）：存在才加载，且先于自动探测，方便单独改一台机器
local machine_specific = vim.fn.stdpath("config") .. "/_machine_specific.vim"
if vim.fn.filereadable(machine_specific) == 1 then
  vim.cmd("source " .. vim.fn.fnameescape(machine_specific))
end

-- 本机环境探测（Python provider / PDF 阅读器）
require("core.env")

-- 加载插件管理器
require("core.lazy")
