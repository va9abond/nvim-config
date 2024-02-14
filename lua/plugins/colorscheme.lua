return {
------------------------------------------------------------
    -- I should setup: "lazy = false" and "priority = 1000"
    -- just for main colorscheme
------------------------------------------------------------
    {
        "rose-pine/neovim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        name = "rose-pine",
        opts = {
            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = "overlay", blend = 10 },

                -- Blend colours against the "base" background
                CursorLine = { bg = "overlay", blend = 20 },
                StatusLine = { fg = "text", bg = "#000000" },

                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                Search = { bg = "#114538", inherit = false },
            },
        },
    },
------------------------------------------------------------
    {
        "metalelf0/jellybeans-nvim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        dependencies = { "rktjmp/lush.nvim" },
    },
------------------------------------------------------------
    {
        dir = "~/gitlocal/colors.nvim", cond = true,
        lazy = false, priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },

        config = function()
            vim.cmd.colorscheme("custom")
        end,
    },
------------------------------------------------------------
    {
        "blazkowolf/gruber-darker.nvim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        name = "blazkowolf-gruber-darker",
        config = function()
            require("plugins.config.gruber-darker")
        end
    },
}
