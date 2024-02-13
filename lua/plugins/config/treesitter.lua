require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all" (the five listed parsers should always
    -- be installed)
    ensure_installed = { "c", "cpp", "lua", "julia", "vim",
                         "vimdoc", "bash" },

    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter`
    -- CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "javascript" },

    highlight = {
        enable = true,

        disable = function(lang, buf)
            print("file too large for tresitter")

            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        additional_vim_regex_highlighting = false,
    },

    indent = { enable = true },
})
