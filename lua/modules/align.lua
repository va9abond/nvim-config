return {
    "Vonr/align.nvim", branch = "v2",
    cond = true, lazy = false,

    init = function()
        local opts = { noremap = true, silent = true }

        -- Aligns to 1 character
        vim.keymap.set('x', 'ga', function()
                require'align'.align_to_char({
                    preview = true,
                    length = 1,
                }) end,
            opts
        )

        -- Aligns to 2 characters with previews
        vim.keymap.set('x', 'gA', function()
                require'align'.align_to_char({
                    preview = true,
                    length = 2,
                }) end,
            opts
        )

        -- Aligns to a string with previews
        vim.keymap.set('x', 'gs',
            function() require'align'.align_to_string({
                    preview = true,
                    regex = false,
                }) end,
            opts
        )

        -- Aligns to a Vim regex with previews
        -- vim.keymap.set('x', 'ar', function()
        --         require'align'.align_to_string({
        --             preview = true,
        --             regex = true,
        --         }) end,
        --     opts
        -- )

        -- Example gawip to align a paragraph to a string with previews
        -- vim.keymap.set(
        --     'n',
        --     'gaw',
        --     function()
        --         local a = require('align')
        --         a.operator(
        --             a.align_to_string,
        --             {
        --                 regex = false,
        --                 preview = true,
        --             }
        --         )
        --     end,
        --     opts
        -- )

        -- Example gaaip to align a paragraph to 1 character
        -- vim.keymap.set(
        --     'n',
        --     'gaa',
        --     function()
        --         local a = require'align'
        --         a.operator(a.align_to_char)
        --     end,
        --     opts
        -- )
    end
}
