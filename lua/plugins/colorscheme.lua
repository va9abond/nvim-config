return {
    {
        dir = "~/gitlocal/colors.nvim", cond = true,
        lazy = false, priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },

        config = function()
            vim.cmd.colorscheme("mycolors")
        end,
    },
    {
        "blazkowolf/gruber-darker.nvim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        name = "blazkowolf-gruber-darker",
        config = function()
            require("gruber-darker")
        end
    },
}
