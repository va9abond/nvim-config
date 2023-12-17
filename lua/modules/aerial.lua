return {
    'stevearc/aerial.nvim',
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        attach_mode = "global", -- window
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
        { "<Bslash>t", "<cmd>AerialToggle<cr>", desc = "Aerial (Symbols)" },
    },

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
}
