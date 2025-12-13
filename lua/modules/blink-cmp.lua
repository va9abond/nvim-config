return {
    'saghen/blink.cmp', cond = true, lazy = false,
    version = '*',

    opts = {
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            -- https://github.com/Saghen/blink.cmp/blob/main/lua/blink/cmp/keymap/presets.lua
            preset = 'none',

            ['<C-y>'] = { 'accept', 'fallback' },
            ['<C-e>'] = { 'cancel', 'fallback' },

            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'show_and_insert', 'select_next', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },

        completion = {
            -- 'prefix' will fuzzy match on the text before the cursor
            -- 'full' will fuzzy match on the text before *and* after the cursor
            -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
            keyword = { range = 'full' },

            trigger = {
                -- prefetch_on_insert = true,
                show_on_keyword = false,
                show_on_trigger_character = false,
            },

            list = {
                selection = { preselect = true, auto_insert = true },
            },

            accept = {
                dot_repeat = true,
                create_undo_point = false,
                auto_brackets = { enabled = false },
            },

            menu = {
                enabled = true,
                auto_show = false,
                min_width = 15,
                max_height = 5,
                border = nil,
                scrolloff = 2,
                scrollbar = true,

                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "source_name" },
                    },

                    -- treesitter = { 'lsp' },
                    treesitter = { },
                },
            },

            documentation = {
                auto_show = false,
                treesitter_highlighting = true,
            },

            ghost_text = {
                enabled = false,
            }
        },

        signature = {
            enabled = true,
            trigger = { enabled = false, }, -- hide by default
            window = {
                treesitter_highlighting = true,
                show_documentation = false,
            },
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' }, -- 'buffer', 'path'

            per_filetype = {
                vim = { inherit_defaults = true, 'cmdline' },
            },

            -- Minimum number of characters in the keyword to trigger all providers
            -- May also be `function(ctx: blink.cmp.Context): number`
                min_keyword_length = 2,

                providers = {
                    lsp = { name = 'LSP' },
                    path = { name = 'path' },
                    buffer = { name = 'abc' },
                    cmdline = { name = 'cmd' },
                    omni = { name = 'omni' },
                    -- snippets = { name = 'snip' },
                },
            },

            cmdline = {
                keymap = {
                    preset = 'none',
                    ['<C-e>'] = { 'cancel', 'fallback' },
                    ['<C-p>'] = { 'select_prev', 'fallback' },
                    ['<C-n>'] = { 'show_and_insert', 'select_next', 'fallback' },
                },

                sources = function()
                    local type = vim.fn.getcmdtype()
                    -- Search forward and backward
                    if type == '/' or type == '?' then return { 'buffer' } end
                    -- Commands
                    if type == ':' or type == '@' then return { 'cmdline', 'buffer' } end
                    return {}
                end,


            },

            -- Use a preset for snippets, check the snippets documentation for more information
            -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' },

            appearance = {
                use_nvim_cmp_as_default = false,
                nerd_font_variant = 'mono'
            },
        },
}
