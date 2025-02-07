return { -- TODO telescope-pathogen
    "nvim-telescope/telescope.nvim",
    cond = true, cmd = "Telescope",
    version = false,

    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        }
    },

    opts = function()
        local actions = require("telescope.actions")

        return{
            defaults = { -- :h telescope.defaults
                scroll_strategy = "limit",

                layout_strategy = "bottom_pane",
                layout_config = {
                    bottom_pane = { height = 12, prompt_position = "top", border = "single" },
                },

                -- prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
                border = true,
                preview = false,

                -- completely remove all of telescope's default maps and use your own
                -- default_mappings = {
                --     n = {
                --         ["q"] = actions.close,
                --         ["<C-c>"] = actions.close,
                --         ["<C-s>"] = actions.file_split,
                --         ["<C-v>"] = actions.file_vsplit,
                --         ["<C-t>"] = actions.file_tab,
                --         ["<leader>q"] = actions.add_selected_to_qflist,
                --         ["<leader>l"] = actions.add_selected_to_loclist,
                --     },
                --     i = {
                --         ["<esc>"] = actions.close,
                --         ["<C-c>"] = actions.close,
                --     }
                --
                -- },
                mappings = {
                    n = {
                        ["q"] = actions.close,
                    },
                },

                git_worktrees = {
                    { toplevel = vim.env.HOME, gitdir = vim.env.HOME .. "/.cfg" }
                },
            },

            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
            },

            pickers = {
                -- buffers = { theme = "ivy", },
                -- find_files = { theme = "ivy", }
            }

        }
    end,

    keys = {
        -- { "<leader>ff", function() require("telescope.builtin").find_files() end },

        { "<leader>ff", function()
            require("telescope.builtin").find_files({
                -- prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
            }) end },

        { "<leader>fb", function()
            require("telescope.builtin").buffers({
                -- require("telescope.themes").get_dropdown({})
                -- sort_mru = true,
                -- prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
            }) end },

        -- { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
        -- { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

        -- { "<leader>fo", function() require("telescope.builtin").oldfiles({
        --     prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
        -- }) end, desc = "Recent" },

        -- { "<leader>fg", function() require("telescope.builtin").live_grep({
        --     prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
        -- }) end, desc = "Live Grep" },

        -- { "<leader>f?", "<cmd>Telescope builtin<cr>", desc = "View Telescope Builtin" },
        -- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

        -- { "<leader>/", function() require("telescope.builtin").current_buffer_fuzzy_find({
        --     prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
        --     previewer = false,
        --     sorting_strategy = "ascending", -- change results order
        -- }) end },
    },


    -- vim.keymap.set('n', '<leader>/', function()
    --     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --         winblend = 10,
    --         previewer = false,
    --     })
    -- end, { desc = '[/] Fuzzily search in current buffer' })

    -- vim.keymap.set('n', '<Bslash>s' , "<cmd>Telescope aerial<cr>")
}

