return {
    "echasnovski/mini.pairs", enabled = false,
    dependencies = {
        'lyokha/vim-xkbswitch'
    },
    event = "VeryLazy",
    opts = {},
    keys = {
        {
            "<Bslash>mp",
            function()
                vim.g.minipairs_disable = not vim.g.minipairs_disable
            end,
            desc = "Toggle auto pairs",
        },
    },
}
