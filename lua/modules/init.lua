return {
    { "nvim-lua/plenary.nvim",       cond = true,  lazy = true   },
    { "nvim-tree/nvim-web-devicons", cond = true,  lazy = true   },

    {
        "tpope/vim-fugitive", lazy = false,
        keys = { {"<leader>G", "<cmd>Git<cr>" }, }
    },

    {
        "numToStr/Comment.nvim", cond = true, lazy = true,
        event = { "VeryLazy" }, config = true
    },

    {
        "mbbill/undotree", cond = true, lazy = true,
        keys = { { "<space>u", "<cmd>UndotreeToggle<cr>", mode = "n" }, },
    },
}
