return {
    'saghen/blink.cmp', cond = true, lazy = false,
    version = '*',

    opts = {
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            preset = 'default',
            -- show_and_insert | show (trigger completion menu)
            ['<Up>'] = { },
            ['<Down>'] = { },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'show_and_insert', 'select_next', 'fallback' },

            ['<C-d>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-b>'] = { },
            ['<C-f>'] = { },
        },

        completion = {
            -- 'prefix' will fuzzy match on the text before the cursor
            -- 'full' will fuzzy match on the text before *and* after the cursor
            -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
            keyword = { range = 'full' },

            trigger = {
                show_on_keyword = false,
                show_on_trigger_character = false,

                -- LSPs can indicate when to show the completion window via trigger characters
                -- however, some LSPs (i.e. tsserver) return characters that would essentially
                -- always show the window. We block these by default.
                -- show_on_blocked_trigger_characters = function()
                --     if vim.api.nvim_get_mode().mode == 'c' then return {} end

                    -- you can also block per filetype, for example:
                    -- if vim.bo.filetype == 'markdown' then
                    --   return { ' ', '\n', '\t', '.', '/', '(', '[' }
                    -- end

                --     return { ' ', '\n', '\t' }
                -- end,

                -- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
                -- the completion window when the cursor comes after a trigger character when
                -- entering insert mode/accepting an item
                -- show_on_x_blocked_trigger_characters = { "'", '"', '(' },
                -- or a function, similar to show_on_blocked_trigger_character
            },

            list = {
                max_items = 25,
                selection = { preselect = true, auto_insert = true },
            },

            accept = {
                auto_brackets = { enabled = false },
            },

            menu = {
                auto_show = false,
                min_width = 15,
                max_height = 10,

                draw = {
                    columns = {
                        { "label", gap = 1 },
                        { "label_description", gap = 1, "kind", gap = 1 },
                        { "source_name" },
                    },

                    components = {
                        -- kind = {
                        --     ellipsis = false,
                        --     width = { fill = true },
                        --     text = '[' .. tostring(function(ctx) return ctx.kind end) .. ']',
                        --     highlight = function(ctx)
                        --         return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind
                        --     end,
                        -- },
                        -- source_name = {
                        --     width = { max = 30 },
                        --     text = '[' .. tostring(function(ctx) return ctx.source_name end) .. ']',
                        --     highlight = 'BlinkCmpSource',
                        -- },
                    },

                    treesitter = { 'lsp' },
                },
            },

            -- Experimental signature help support
            -- signature = {
            --     enabled = false,
                -- window = { show_documentation = false },
                -- signature.window.show_documentation = false
            -- },
        },

        sources = {
            default = { 'lsp', 'path', 'buffer' }, -- 'buffer', 'path'

            -- You may also define providers per filetype
            -- per_filetype = {
            --     lua = { 'lsp', 'path' },
            -- },

            cmdline = function()
                local type = vim.fn.getcmdtype()
                -- Search forward and backward
                if type == '/' or type == '?' then return { 'buffer' } end
                -- Commands
                if type == ':' or type == '@' then return { 'cmdline' } end
                return {}
            end,

            -- Minimum number of characters in the keyword to trigger all providers
            -- May also be `function(ctx: blink.cmp.Context): number`
            -- min_keyword_length = 0,

            providers = {
                lsp = { name = '[LSP]' },
                path = { name = '[path]' },
                buffer = { name = '[abc]' },
                cmdline = { name = '[cmd]' },
                snippets = { name = '[snip]' },
            },
        },

        -- Use a preset for snippets, check the snippets documentation for more information
        -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'mono'
        },
    },
}
