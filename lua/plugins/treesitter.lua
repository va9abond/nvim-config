return {
    "nvim-treesitter/nvim-treesitter", cond = true, lazy = true,
    build = ":TSUpdate", version = false,
    event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    config = function()
        require("nvim-treesitter.configs").setup({
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,

                disable = { "gitcommit", "tex", "bib", "latex"},
            },

            indent = { enable = true },

            -- A list of parser names, or "all" (the five listed parsers should always
            -- be installed)
            ensure_installed = { "c", "cpp", "lua", "julia", "vim", "vimdoc", "bash" },

            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter`
            -- CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (for "all")
            ignore_install = { "javascript" },
        })
    end,
}
