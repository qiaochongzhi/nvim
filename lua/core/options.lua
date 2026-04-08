local opt = vim.opt

-- helpers
local has = vim.fn.has
local executable = vim.fn.executable

local is_wsl = has("wsl") == 1
local is_mac = has("macunix") == 1
local is_linux = has("unix") == 1 and not is_mac and not is_wsl
local has_linux_clip_tool = executable("xclip") == 1 or executable("xsel") == 1 or executable("wl-copy") == 1

local function setup_wsl_windows_clipboard()
    if executable("clip.exe") == 1 and executable("powershell.exe") == 1 then
        vim.g.clipboard = {
            name = "wsl-clip.exe",
            copy = {
                ["+"] = "clip.exe",
                ["*"] = "clip.exe",
            },
            paste = {
                ["+"] = 'powershell.exe -NoProfile -Command [Console]::Out.Write((Get-Clipboard -Raw).ToString().Replace("`r", ""))',
                ["*"] = 'powershell.exe -NoProfile -Command [Console]::Out.Write((Get-Clipboard -Raw).ToString().Replace("`r", ""))',
            },
            cache_enabled = 0,
        }
        return true
    end
    return false
end

-- Basic
opt.mouse = "a"
--opt.clipboard = "unnamedplus"

-- clipboard
-- WSL: prefer Windows clipboard bridge
-- macOS: use unnamedplus directly
-- Linux: use unnamedplus directly when available
if is_wsl and executable("win32yank.exe") == 1 then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
        },
        paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
        },
        cache_enabled = 0,
    }
    opt.clipboard = "unnamedplus"
elseif is_wsl and setup_wsl_windows_clipboard() then
    opt.clipboard = "unnamedplus"
elseif is_wsl then
    -- Fallback for WSL sessions that only have Linux clipboard tools.
    if has_linux_clip_tool then
        opt.clipboard = "unnamedplus"
    else
        opt.clipboard = ""
    end
elseif is_mac then
    opt.clipboard = "unnamedplus"
elseif is_linux then
    -- On most desktop Linux environments this is fine.
    -- If running in a headless server without clipboard provider,
    -- Neovim will fall back more gracefully is we leave clipboard empty.
    if has_linux_clip_tool then
        opt.clipboard = "unnamedplus"
    else
        opt.clipboard = ""
    end
else
    opt.clipboard = ""
end

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
