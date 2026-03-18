return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        theme = "tokyonight",
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },

        lualine_x = {
          function()
            return os.date("%H:%M")
          end,
          "encoding",
          "filetype",
        },

        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
