return {
    dir = "~/gitlocal/colors.nvim", cond = true,
    lazy = false, priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },

    config = function()
        vim.cmd.colorscheme("mycolors")
    end,
}
