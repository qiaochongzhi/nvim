local opt = vim.opt

-- Basic
opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Show
opt.number = true
opt.relativenumber = true
opt.ruler = true
opt.cursorline = true
opt.termguicolors = true

-- indent
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true
opt.autoindent = true

-- listchars
opt.list = true
opt.listchars = { tab = "▸ ", trail = "▫" }

-- 滚动与换行
opt.scrolloff = 5
opt.wrap = true

-- file
--opt.swapfile = false

-- 折叠
opt.foldmethod = "indent"
opt.foldlevel = 99

-- 分屏
opt.splitright = true
opt.splitbelow = true

-- 状态栏 / 命令
opt.laststatus = 2
--opt.autochdir = true
opt.showcmd = true
opt.formatoptions:remove({ "t", "c" })

-- wildmenu
opt.wildignore = { "__pycache__", ".git", "*.o", "*.out", "log/**", "node_modules/**", "target/**", "tmp/**", "*.rbc" }
opt.wildmenu = true
opt.wildmode = { "longest", "list", "full" }

-- 搜索
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- 终端光标形状（保留你原来的行为）
--vim.opt.guicursor = ""
--vim.cmd([[let &t_SI .= "\e[5 q"]])
--vim.cmd([[let &t_SR .= "\e[4 q"]])
--vim.cmd([[let &t_EI .= "\e[1 q"]])

-- 旧配置里有一行 exec "nohlsearch"，启动后清掉高亮
vim.schedule(function()
  vim.cmd("nohlsearch")
end)


