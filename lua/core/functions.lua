function _G.CompileRunGcc()
  vim.cmd("write")
  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")
  local file_no_ext = vim.fn.expand("%<")

  if ft == "c" then
    vim.cmd("!" .. "g++ " .. file .. " -o " .. file_no_ext)
    vim.cmd("!" .. "time ./" .. file_no_ext)

  elseif ft == "cpp" then
    vim.cmd("!" .. "g++ " .. file .. " -o " .. file_no_ext)
    vim.cmd("!" .. "time ./" .. file_no_ext)

  elseif ft == "java" then
    vim.cmd("!" .. "javac " .. file)
    vim.cmd("!" .. "time java " .. file_no_ext)

  elseif ft == "sh" then
    vim.cmd("!time bash " .. file)

  elseif ft == "python" then
    vim.cmd("!clear")
    vim.cmd("!time python3 " .. file)

  elseif ft == "html" then
    vim.cmd("!firefox " .. file .. " &")

  elseif ft == "markdown" then
    vim.cmd("MarkdownPreview")

  elseif ft == "vimwiki" then
    vim.cmd("MarkdownPreview")
  else
    print("No run rule for filetype: " .. ft)
  end
end
