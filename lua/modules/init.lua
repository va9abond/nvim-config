return {
    { "nvim-lua/plenary.nvim",       cond = true, lazy = true },
    { "nvim-tree/nvim-web-devicons", cond = true, lazy = true },
    { "numToStr/Comment.nvim",       cond = true, lazy = false,
        config = true
    },

    {
        "tpope/vim-fugitive", cond = true, lazy = false,
        config = function()
            vim.keymap.set('n', '<leader>g', '<cmd>Git<cr>')
        end
    },

    {
        "mbbill/undotree", cond = true, lazy = false,
        config = function()
            vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>')
        end
    },
}
