return {
    "nvim-telescope/telescope.nvim", cond = false, lazy = true,
    cmd = "Telescope",
    version = false,

    dependencies = {
        { "nvim-lua/plenary.nvim" },

        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        }
    },

    opts = function()
        local actions  = require("telescope.actions")

        return {
            defaults = {
                mappings = {
                    n = { ["q"] = actions.close, },
                },

                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    aerial = {},
                }
            }
        }
    end,

    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end },
        { "<leader>ft", "<cmd>Telescope tags<cr>", desc = "Find Tags" },
        { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Find Buffers" },
        { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>f?", "<cmd>Telescope builtin<cr>", desc = "View Telescope Builtin" },
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

    },


    -- vim.keymap.set('n', '<leader>/', function()
    --     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --         winblend = 10,
    --         previewer = false,
    --     })
    -- end, { desc = '[/] Fuzzily search in current buffer' })
    --
    -- vim.keymap.set('n', '<Bslash>s' , "<cmd>Telescope aerial<cr>")
}
