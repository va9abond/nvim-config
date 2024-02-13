require("harpoon").setup({
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
        width = vim.api.nvim_win_get_width(0) * 0.5
    },
})


------------------------------------------------------------
                                                    -- Binds

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")


vim.keymap.set("n", "<leader>m", function() mark.add_file() end)
vim.keymap.set("n", "<leader>M", function() ui.toggle_quick_menu() end)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

vim.keymap.set('n', "[m", function() ui.nav_prev() end)
vim.keymap.set('n', "m]", function() ui.nav_next() end)
