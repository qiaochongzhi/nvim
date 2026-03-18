local autocmd = vim.api.nvim_create_autocmd

-- 打开终端自动进入插入模式
autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("startinsert")
  end,
})

-- 恢复上次光标位置
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line([['"]])
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd([[normal! g'"]])
    end
  end,
})

-- 自动切换本地工作目录到当前文件所在目录
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local file = vim.api.nvim_buf_get_name(0)
    if file ~= "" then
      vim.cmd("silent! lcd %:p:h")
    end
  end,
})
