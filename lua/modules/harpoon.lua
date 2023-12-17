-- ---------------------------------------------------------
                  -- https://github.com/ThePrimeagen/harpoon
-- ---------------------------------------------------------
return {
     'ThePrimeagen/harpoon',
     branch = 'harpoon2',
     config = function()
        local hrn = require("harpoon")
        hrn:setup({
            settings = {
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 4,
                },
            }
        })
                                                 -- Mappings
        vim.keymap.set("n", "<leader>m", function() hrn:list():append() end)
        vim.keymap.set("n", "<leader>e", function()
                hrn.ui:toggle_quick_menu(hrn:list())
            end)
        vim.keymap.set("n", "<leader>1", function() hrn:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() hrn:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() hrn:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() hrn:list():select(4) end)
    end,
}
