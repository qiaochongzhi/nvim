return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    cmd = "Telescope",
    keys = {
       {
          "<leader>ff",
          function()
            local builtin = require("telescope.builtin")
            local cwd = vim.fn.getcwd()

            -- try git root
            local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

            if vim.v.shell_error == 0 then
              cwd = git_root
            end

            builtin.find_files({ cwd = cwd })
          end,
          desc = "Find files (project root)",
      },
      {
        "<leader>fg",
        "<cmd>Telescope live_grep<CR>",
        desc = "Live grep",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<CR>",
        desc = "Buffers",
      },
      {
        "<leader>fh",
        "<cmd>Telescope help_tags<CR>",
        desc = "Help tags",
      },
      {
        "<leader>fk",
        "<cmd>Telescope keymaps<CR>",
        desc = "Keymaps",
      },
      {
        "<leader>fd",
        function ()
            require("telescope.builtin").find_files({
                cwd = vim.fn.expand("%:p:h"),
            })
        end,
        desc = "Find files (current dir)",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
}
