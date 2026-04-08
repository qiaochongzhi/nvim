return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = false,
            },
            panel = {
                enabled = false,
            },
            filetypes = {
                markdown = true,
                gitcommit = true,
                help = false,
            },
        },
    },

    {
        "zbirenbaum/copilot-cmp",
        dependencies = { "zbirenbaum/copilot.lua"},
        config = function ()
            require("copilot_cmp").setup()
        end,
    },
}
