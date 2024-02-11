return {
    "echasnovski/mini.pairs", enabled = true,
    event = "VeryLazy",
    opts = {
        mappings = {
            ['$'] = { action = 'open', pair = '$$', neigh_pattern = '[^\\].' },
            ['$'] = { action = 'close', pair = '$$', neigh_pattern = '[^\\].' },
        }
    },
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
