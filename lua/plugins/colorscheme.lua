return {
    {
        dir = "~/gitlocal/x-gruber-darker.nvim", cond = true,
        lazy = false, priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },

        config = function()
            vim.cmd.colorscheme("xgruber")
        end,
    },

    {
        "habamax/vim-habamax", lazy = false, priority = 1000,
    },

    {
        "blazkowolf/gruber-darker.nvim",

        -- config = function()
        --     vim.cmd.colorscheme("gruber-darker")
        -- end,
    },

    {
        "metalelf0/jellybeans-nvim"
    },
}
