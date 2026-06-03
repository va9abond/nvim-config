return {
    { "nvim-lua/plenary.nvim",       cond = true, lazy = true },
    { "nvim-tree/nvim-web-devicons", cond = false, lazy = true },

    {
        "numToStr/Comment.nvim", cond = false,
        lazy = false, config = true
    },

    { "ludovicchabant/vim-gutentags", cond = true, lazy = false },

    {
        "tpope/vim-fugitive", cond = true, lazy = false,
        config = function()
            vim.keymap.set('n', '<leader>G', '<cmd>tab Git<cr>')
        end
    },

    {
        "tpope/vim-dispatch", cond = false, lazy = false,
    },

    {
        "mbbill/undotree", cond = true, lazy = false,
        config = function()
            vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')
        end
    },
}
