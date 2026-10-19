local env = require("core.env")

return {
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      -- 编译方法
      vim.g.vimtex_compiler_method = "latexmk"

      -- viewer：macOS 用 Skim，Linux 用 okular/zathura 等，按本机实际安装情况选择
      vim.g.vimtex_view_method = env.vimtex_viewer
      if env.vimtex_viewer == "general" and vim.fn.has("mac") == 1 then
        vim.g.vimtex_view_general_viewer = "open"
      end

      -- 禁用 quickfix 自动弹出
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
