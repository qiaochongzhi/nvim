return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- make sure it loads first
    config = function()
      vim.cmd("colorscheme tokyonight")
    end,
  },
}
