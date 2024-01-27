-- ---------------------------------------------------------
                  -- https://github.com/ThePrimeagen/harpoon
-- ---------------------------------------------------------
return {
     'ThePrimeagen/harpoon',
     branch = 'harpoon2',
     dependencies = {
        "nvim-telescope/telescope.nvim",
     },
     config = function()
        local hrp = require("harpoon")
        hrp:setup({
            settings = {
                menu = {
                    width = vim.api.nvim_win_get_width(0) - 4,
                },
            }
        })

        local tconf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = tconf.file_previewer({}),
                sorter = tconf.generic_sorter({}),
            }):find()
        end

                                                 -- Mappings
        vim.keymap.set("n", "<C-e>", function() toggle_telescope(hrp:list()) end,
                                                    { desc = "Open harpoon window" })

        vim.keymap.set("n", "<leader>m", function() hrp:list():append() end)
        vim.keymap.set("n", "<leader>e", function()
                hrp.ui:toggle_quick_menu(hrp:list())
            end)
        -- vim.keymap.set('n', "<ESC>", function()
        --         hrn.ui:toggle_quick_menu(hrn:list())
        --     end)
        vim.keymap.set("n", "<leader>1", function() hrp:list():select(1) end)
        vim.keymap.set("n", "<leader>2", function() hrp:list():select(2) end)
        vim.keymap.set("n", "<leader>3", function() hrp:list():select(3) end)
        vim.keymap.set("n", "<leader>4", function() hrp:list():select(4) end)
    end,


}

-- -- basic telescope configuration
-- l  { desc = "Open harpoon window" })
