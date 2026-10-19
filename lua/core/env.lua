-- 本机环境自适应：Python provider 与 LaTeX PDF 阅读器
-- 目的：同一份配置在 macOS / Linux / WSL 之间同步时，不写死本机路径

local M = {}

local function executable(path)
  return type(path) == "string" and path ~= "" and vim.fn.executable(path) == 1
end

local function is_windows()
  return vim.fn.has("win32") == 1
end

-- 直接在 site-packages 里找 pynvim/neovim 包，避免每次启动都启动解释器（约 100ms）
local function prefix_has_pynvim(prefix)
  local patterns = {
    "/lib/python*/site-packages/pynvim",
    "/lib/python*/site-packages/neovim",
    "/lib64/python*/site-packages/pynvim",
    "/lib64/python*/site-packages/neovim",
    "/Lib/site-packages/pynvim",
    "/Lib/site-packages/neovim",
  }

  for _, pattern in ipairs(patterns) do
    if #vim.fn.glob(prefix .. pattern, false, true) > 0 then
      return true
    end
  end

  return false
end

local function has_pynvim(python)
  if not executable(python) then
    return false
  end

  -- pynvim 0.6+ 会安装 pynvim-python 启动器，存在即说明该环境已装好
  if python:match("pynvim%-python$") then
    return true
  end

  -- .../bin/python -> ... （Windows 的 .../Scripts/python.exe 同样适用）
  local prefix = vim.fn.fnamemodify(python, ":h:h")
  return prefix_has_pynvim(prefix)
end

local function python_candidates()
  local list, seen = {}, {}

  local function add(path)
    if type(path) == "string" and path ~= "" and not seen[path] then
      seen[path] = true
      list[#list + 1] = path
    end
  end

  -- 1) Neovim 0.12+ 会在 PATH 中寻找 pynvim-python
  add(vim.fn.exepath("pynvim-python"))

  -- 2) 当前激活的 conda / venv
  if vim.env.CONDA_PREFIX then
    add(vim.env.CONDA_PREFIX .. (is_windows() and "/python.exe" or "/bin/python"))
  end
  if vim.env.VIRTUAL_ENV then
    add(vim.env.VIRTUAL_ENV .. (is_windows() and "/Scripts/python.exe" or "/bin/python"))
  end

  -- 3) 常见的 Anaconda / Miniconda 安装位置
  local home = vim.fn.expand("~")
  for _, dir in ipairs({ "/anaconda3", "/miniconda3", "/opt/anaconda3", "/mambaforge", "/miniforge3" }) do
    add(home .. dir .. (is_windows() and "/python.exe" or "/bin/python"))
  end

  -- 4) PATH 里的 python3 / python
  add(vim.fn.exepath("python3"))
  add(vim.fn.exepath("python"))

  -- 5) 系统级兜底
  add("/opt/homebrew/bin/python3")
  add("/usr/local/bin/python3")
  add("/usr/bin/python3")

  return list
end

-- 外部已经指定 g:python3_host_prog 时无条件尊重，不再自动探测
if type(vim.g.python3_host_prog) == "string" and vim.g.python3_host_prog ~= "" then
  M.python_host_prog = vim.g.python3_host_prog
else
  local python = nil
  for _, candidate in ipairs(python_candidates()) do
    if has_pynvim(candidate) then
      python = candidate
      break
    end
  end

  if python then
    vim.g.python3_host_prog = python
    M.python_host_prog = python
  else
    -- 没有带 pynvim 的解释器时直接关掉 provider，
    -- 否则每次启动/退出都会报 "Failed to load python3 host"
    vim.g.loaded_python3_provider = 0
    M.python_host_prog = nil
  end
end

-- LaTeX PDF 阅读器：按系统和实际安装的程序选择
M.vimtex_viewer = (function()
  if vim.fn.has("mac") == 1 then
    if vim.fn.isdirectory("/Applications/Skim.app") == 1 then
      return "skim" -- Skim 支持正向/反向搜索
    end
    return "general" -- 没有 Skim 时用系统默认阅读器（open）
  end

  if vim.fn.has("wsl") == 1 then
    return "general"
  end

  for _, viewer in ipairs({ "okular", "zathura", "qpdfview", "evince" }) do
    if vim.fn.executable(viewer) == 1 then
      return viewer
    end
  end

  return "general"
end)()

return M
