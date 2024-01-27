-- ---------------------------------------------------------
                   -- https://github.com/folke/zen-mode.nvim
-- ---------------------------------------------------------
return {
    "folke/zen-mode.nvim",
    opts = {
        plugins = {
            options = { showcmd = true },
            gitsigns = { enable = true },
            tmux = { enable = true }
        }
    }
}
