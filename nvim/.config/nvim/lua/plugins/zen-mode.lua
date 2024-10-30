return {
    "folke/zen-mode.nvim",
    keys = "<leader>z",
    cmd = "ZenMode",
    opts = {
        window = {
            backdrop = 1,
            width = 0.6,
            height = 0.7,
            options = {
                signcolumn = "no",
                number = false,
            },
        },
        plugins = {
            kitty = {
                enabled = true,
                font = "+10",
            },
        },
    },
    config = function(_, opts)
        local zm = require("zen-mode")
        zm.setup(opts)
        vim.keymap.set("n", "<leader>z", function()
            zm.toggle()
        end, {})
    end,
}
