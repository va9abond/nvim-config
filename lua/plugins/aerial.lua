return {
    "stevearc/aerial.nvim", cond = false, lazy = true,

    event = { "BufReadPost", "BufWritePost", "BufNewFile" },

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        attach_mode = "global", -- global | window
        backends = { "lsp", "treesitter", "markdown", "man" },
        show_guides = true,

        layout = {
            max_width = {0.35},
            min_width = {0.2,  30},
            resize_to_content = true,
            win_opts = {
                winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
                signcolumn = "yes",
                statuscolumn = " ",
            },
        },

        filter_kind = false,
    },

    keys = {
        { "<space>a", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },
}
