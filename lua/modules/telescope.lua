return {
    "nvim-telescope/telescope.nvim", cond = false,
    tag = '0.1.8',

    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },

    config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')

        telescope.setup({
            defaults = {
                scroll_strategy = 'limit',
                layout_strategy = 'bottom_pane',
                layout_config = {
                    bottom_pane = {
                        height = 9,
                        prompt_position = 'top',
                        -- border = 'none',
                    }
                },

                results_title = false,
                -- prompt_title = false, -- inner buultin opts preferred
                preview_title = false,
                borderchars = { "─", "", "", "", "", "", "", "" },

                -- preview = false,
                preview = {
                    hide_on_startup = true,
                },

                mappings = {
                    i = {
                        ["<C-c>"] = actions.close,
                        ["<Tab>"] = actions.toggle_selection,
                        ['<C-y>'] = require('telescope.actions.layout').toggle_preview,
                    },
                    n = {
                        ["<C-c>"] = actions.close,
                        ["<Tab>"] = actions.toggle_selection,
                        ['<C-y>'] = require('telescope.actions.layout').toggle_preview,
                        ['Y'] = require('telescope.actions.layout').toggle_prompt_position,
                    },
                },

            },


            pickers = {
                find_files = {
                    prompt_title = false,
                    preview_title = false,
                    prompt_prefix = 'Find files: ', -- vim.api.nvim_buf_get_name(0) .. ": ",
                },

                live_grep = {
                    prompt_title = false,
                    preview_title = false,
                    prompt_prefix = 'Live grep: ',
                },

                buffers = {
                    prompt_title = false,
                    preview_title = false,
                    prompt_prefix = 'Buffers: ',
                },

                oldfiles = {
                    prompt_title = false,
                    preview_title = false,
                    prompt_prefix = 'Oldfiles: ',
                },

                help_tags = {
                    prompt_title = false,
                    preview_title = false,
                    prompt_prefix = 'Help tags: ',
                },

                builtin = {
                    prompt_title = false,
                    preview_title = false,
                    prompt_prefix = 'Builtin: ',
                },
            },

            extensions = {
                fzf = {},
            },
        })


        -- load fzf extension
        telescope.load_extension('fzf')

        -- keymaps
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({
                hidden = true,
            })
        end, { desc = 'telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,  { desc = 'telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers,    { desc = 'telescope buffers' })
        vim.keymap.set('n', '<leader>fo', builtin.oldfiles,   { desc = 'telescope old (recent) files' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,  { desc = 'telescope help tags' })
        vim.keymap.set('n', '<leader>f?', builtin.builtin,    { desc = 'telescope builtin list' })
    end,
}
