return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 15,
                hide_during_completion = true,
                keymap = {
                    -- 交由 nvim-cmp 的映射统一处理（Tab / C-n / C-p）
                    accept = false,
                    next = false,
                    prev = false,
                },
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
}
