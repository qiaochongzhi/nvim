return {
  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      -- 编译方法
      vim.g.vimtex_compiler_method = "latexmk"

      -- viewer（Linux/KDE 用 okular，支持 Ctrl+点击 反向跳转到源码）
      vim.g.vimtex_view_method = "okular"

      -- 禁用 quickfix 自动弹出
      vim.g.vimtex_quickfix_mode = 0
    end,
  },
}
