return {
    "ej-shafran/compile-mode.nvim", cond = true, lazy = false,
    branch = "latest",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        vim.g.compile_mode = {
            default_command = "",
            baleia_setup = false, -- ANSI escape codes support, require 'm00qek/baleia.nvim'
            auto_jump_to_first_error = false,
            error_locus_highlight = 1000,
            use_diagnostics = false,
            recompile_no_fail = true,
            -- buffer_name = "[compilation results]",
            buffer_name = "*compilation results*",
        }

        vim.keymap.set(
            'n', '<C-x>c', '<cmd>Compile<cr>',
            { desc = 'compile-mode Compile' }
        )
    end,
}
