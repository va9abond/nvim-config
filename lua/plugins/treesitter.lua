return {

    "nvim-treesitter/nvim-treesitter", cond = true, lazy = false,
    -- event = { "BufReadPost", "BufWritePost", "BufNewFile", "VeryLazy" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    build = ":TSUpdate", version = false,

    opts = {
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

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },
    },
}
