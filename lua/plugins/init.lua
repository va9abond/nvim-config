return {
------------------------------------------------------------
    {
        "nvim-lua/plenary.nvim", cond = true, lazy = true
    },
------------------------------------------------------------
    {
        "nvim-tree/nvim-web-devicons", cond = true, lazy = true
    },
------------------------------------------------------------
    {
        "numToStr/Comment.nvim", cond = true, lazy = true,
        event = { "VeryLazy" },
        config = true
    },
------------------------------------------------------------
    {
        "tpope/vim-fugitive", cond = true, lazy = false,
    },
------------------------------------------------------------
    {
        "mbbill/undotree", cond = true,
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", mode = "n" },
        },
    },
------------------------------------------------------------
    {
        "lyokha/vim-xkbswitch", cond = false, lazy = true,
    },
}
