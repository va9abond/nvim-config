return {
    "ThePrimeagen/harpoon", cond = true, lazy = false,
    branch = "master",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {
        global_settings = {
            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = false,

            -- saves the harpoon file upon every change. disabling is unrecommended.
            save_on_change = true,

            -- filetypes that you want to prevent from adding to the harpoon list menu.
            excluded_filetypes = { "harpoon" },

            -- set marks specific to each git branch inside git repository
            mark_branch = false,

            -- enable tabline with harpoon marks
            tabline = false,
        },

        menu = {
            width = vim.api.nvim_win_get_width(0) - 40
        },
    },

    keys = {
        { "<leader>m", function() require("harpoon.mark").add_file() end },
        { "<leader>M", function() require("harpoon.ui").toggle_quick_menu() end },

        { "<leader>1", function() require("harpoon.ui").nav_file(1) end },
        { "<leader>2", function() require("harpoon.ui").nav_file(2) end },
        { "<leader>3", function() require("harpoon.ui").nav_file(3) end },
        { "<leader>4", function() require("harpoon.ui").nav_file(4) end },


        { "[m", function() require("harpoon.ui").nav_prev() end },
        { "]m", function() require("harpoon.ui").nav_next() end },
    },
}
