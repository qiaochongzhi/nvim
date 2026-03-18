return {
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      -- 编译方法
      vim.g.vimtex_compiler_method = "latexmk"

      -- viewer（WSL 推荐用 zathura 或 Windows PDF）
      vim.g.vimtex_view_method = "general"

      -- 禁用 quickfix 自动弹出
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
