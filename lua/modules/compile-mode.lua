return {
    "ej-shafran/compile-mode.nvim", cond = true, lazy = false,
    branch = "latest",

    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function()
        vim.g.compile_mode = {
            default_command = "make -B",
            baleia_setup = false,
            auto_jump_to_first_error = false,
            error_locus_highlight = 1000,
            use_diagnostics = false,
            recompile_no_fail = true,
            buffer_name = "[compilation results]",
        }
    end,

}
