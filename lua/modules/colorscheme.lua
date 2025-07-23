return {
    dir = "~/gitlocal/xgruber.nvim", cond = true,
    lazy = false, priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },

    config = function()
        vim.cmd.colorscheme("xgruber")
    end,
}
