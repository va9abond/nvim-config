-- ---------------------------------------------------------
-- https://github.com/nvim-telescope/telescope.nvim
-- ---------------------------------------------------------
return {
    "nvim-telescope/telescope.nvim",
    version = false,

    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        enabled = vim.fn.executable("make") == 1,
    },

    config = function()
        local builtin  = require('telescope.builtin')
        local actions  = require('telescope.actions')
        local lactions = require('telescope.actions.layout')
        local themes   = require("telescope.themes")

        require('telescope').setup({
            defaults = {
                mappings = {
                    n = {
                        ["q"] = actions.close,
                    }
                }
            },

            picker = {
                find_files = {
                    find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
                    mappings = {
                        n = {
                            -- change directory
                            ["cd"] = function(prompt_bufnr)
                                local selection = require("telescope.actions.state").get_selected_entry()
                                local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                                require("telescope.actions").close(prompt_bufnr)
                                -- Depending on what you want put `cd`, `lcd`, `tcd`
                                vim.cmd(string.format("silent cd %s", dir))
                            end,
                        }
                    }
                },
            },
                                            -- fzf extension
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                aerial = {},
            },

            require('telescope').load_extension('fzf')
        })

        vim.keymap.set('n', '<leader>fo',  builtin.oldfiles, { desc = '[?] Find recently opened files' })

        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- vim.keymap.set('n', "<leader>fp", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>")
        vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
        vim.keymap.set('n', '<leader>f?', builtin.builtin, { desc = 'View Telescope Builtin' })
        vim.keymap.set('n', '<Bslash>s' , "<cmd>Telescope aerial<cr>")

    end
}
