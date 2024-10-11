return {
    "nvim-telescope/telescope.nvim", cond = true, lazy = false,
    cmd = "Telescope",
    version = false,

    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "telescope-pathogen.nvim",
        { "nvim-telescope/telescope-file-browser.nvim",
            config = function()
                require("telescope").load_extension("file_browser")
            end, },
        { "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end, }
    },

    opts = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")
        local fb_actions = require("telescope").extensions.file_browser.actions

        return {
            defaults = {
                layout_strategy = "bottom_pane",
                layout_config = {
                    bottom_pane = {
                        height = 10,
                        -- width = vim.o.columns, -- maximally available columns
                        preview_cutoff = 120,
                        prompt_position = "top"
                    },
                },

                -- completely remove all of telescope's default maps and use your own
                -- default_mappings = { ... },
                mappings = {
                    n = {
                        ["q"] = actions.close,
                        ["?"] = actions.which_key,
                    },
                },
                preview = true,
                git_worktrees = {
                    {
                        toplevel = vim.env.HOME,
                        gitdir = vim.env.HOME .. '/.cfg'
                    }
                },

                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },

                    aerial = {},

                    -- pathogen = {},

                    file_browser = {
                        grouped = true,
                        add_dirs = true, -- show dirs
                        hijack_netrw = false,
                        hidden = { file_browser = true, folder_browser = true },
                        hide_parent_dir = true,
                        display_stat = { date = true, size = false, mode = true },
                        prompt_path = true,
                        theme = "ivy",
                        mappings = {
                            ["i"] = {
                                ["<A-c>"] = false,
                                ["<S-CR>"] = false,
                                ["<A-r>"] = false,
                                ["<A-m>"] = false,
                                ["<A-y>"] = false,
                                ["<A-d>"] = false,
                                ["<C-m>"] = fb_actions.open,
                                ["<C-g>"] = false,
                                ["<C-e>"] = fb_actions.goto_parent_dir,
                                ["<C-w>"] = fb_actions.goto_cwd,
                                ["<C-t>"] = fb_actions.change_cwd,
                                ["<C-f>"] = false,
                                ["<C-h>"] = false,
                                ["<C-s>"] = false,
                                ["<bs>"] = fb_actions.backspace,
                            },
                            ["n"] = {
                                ["c"] = fb_actions.create,
                                ["r"] = fb_actions.rename,
                                ["m"] = fb_actions.move,
                                ["y"] = fb_actions.copy,
                                ["d"] = fb_actions.remove,
                                ["<C-l>"] = fb_actions.open,
                                ["<C-h>"] = fb_actions.goto_parent_dir,
                                ["e"] = fb_actions.goto_home_dir,
                                ["_"] = fb_actions.goto_cwd,
                                ["<leader>cd"] = fb_actions.change_cwd,
                                ["f"] = false,
                                ["g."] = fb_actions.toggle_hidden,
                                ["s"] = false,
                            },
                        },
                    },

                }
            },
            -- builtin = {
            --     live_grep = {
            --         cwd = "utils.buffer_dir()",
            --     }
            -- }
        }
    end,

    keys = {
        -- { "<leader>ff", function() require("telescope.builtin").find_files() end },

        { "<leader>ff", function() require("telescope.builtin").find_files({
            prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
        }) end },

        -- { "<leader>fb", function() require("telescope").extensions.file_browser.file_browser({ }) end, },
        { "<leader>fb", "<cmd>Telescope file_browser<cr>", desc = "File_Browser" },
        --
        -- { "<leader>ft", "<cmd>Telescope tags<cr>", desc = "Find Tags" },
        -- { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Find Buffers" },
        -- { "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
        -- { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

        { "<leader>fo", function() require("telescope.builtin").oldfiles({
            prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
        }) end, desc = "Recent" },

        { "<leader>fg", function() require("telescope.builtin").live_grep({
            prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
        }) end, desc = "Live Grep" },

        { "<leader>f?", "<cmd>Telescope builtin<cr>", desc = "View Telescope Builtin" },
        -- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
        -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },

        { "<leader>/", function() require("telescope.builtin").current_buffer_fuzzy_find({
            prompt_prefix = vim.api.nvim_buf_get_name(0) .. " > ",
            previewer = false,
            sorting_strategy = "ascending", -- change results order
        }) end },

    },


    -- vim.keymap.set('n', '<leader>/', function()
    --     builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --         winblend = 10,
    --         previewer = false,
    --     })
    -- end, { desc = '[/] Fuzzily search in current buffer' })

    -- vim.keymap.set('n', '<Bslash>s' , "<cmd>Telescope aerial<cr>")
}
