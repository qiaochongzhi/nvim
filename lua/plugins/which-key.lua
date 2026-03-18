return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 300,
      preset = "modern",
      win = {
        border = "rounded",
      },
      layout = {
        spacing = 6,
      },
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>s", group = "Split" },
        { "<leader>t", group = "Tab" },
        { "<leader>u", group = "UI / Undo / Toggle" },
        { "<leader>r", group = "Run" },
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>l", group = "LaTeX" },
        { "<leader>m", group = "Markdown" },

        { "<leader>w", desc = "Write file" },
        { "<leader>q", desc = "Quit window" },
        { "<leader>h", desc = "Clear search highlight" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer local keymaps",
      },
    },
  },
}
