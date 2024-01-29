return {
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-vinegar", enabled = false },

    {
        "mbbill/undotree", enabled = true,
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end,
    },

    {
        "lyokha/vim-xkbswitch", enabled = true,
    },
}
