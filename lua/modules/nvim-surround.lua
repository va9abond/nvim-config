return {
    "kylechui/nvim-surround", cond = true,
    version = "^4.0.0",
    event = "VeryLazy",

    opts = {
        aliases = false,
        move_cursor = false,
        indent_lines = false,
    },

    config = function()
        vim.g.nvim_surround_no_mappings = true,

        vim.keymap.set("n", "ys", "<Plug>(nvim-surround-normal)", {
            desc = "Add a surrounding pair around a motion (normal mode)",
        })

        vim.keymap.set("x", "S", "<Plug>(nvim-surround-visual)", {
            desc = "Add a surrounding pair around a visual selection",
        })

        vim.keymap.set("x", "gS", "<Plug>(nvim-surround-visual-line)", {
            desc = "Add a surrounding pair around a visual selection, on new lines",
        })

        vim.keymap.set("n", "ds", "<Plug>(nvim-surround-delete)", {
            desc = "Delete a surrounding pair",
        })

        vim.keymap.set("n", "cs", "<Plug>(nvim-surround-change)", {
            desc = "Change a surrounding pair",
        })

        vim.keymap.set("n", "cS", "<Plug>(nvim-surround-change-line)", {
            desc = "Change a surrounding pair, putting replacements on new lines",
        })
    end,
}
