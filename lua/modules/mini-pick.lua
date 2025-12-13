return {
    "echasnovski/mini.pick", version = "*", cond = false, lazy = false,
    opts = {
        -- Keys for performing actions. See `:h MiniPick-actions`.
        mappings = {
            caret_left  = '<C-b>',
            caret_right = '<C-f>',

            choose            = '<CR>',
            choose_in_split   = '<C-s>',
            choose_in_tabpage = '<C-t>',
            choose_in_vsplit  = '<C-v>',
            choose_marked     = '<M-CR>',

            delete_char       = '<C-h>',
            delete_char_right = '<C-g>',
            delete_left       = '<C-u>',
            delete_word       = '<C-w>',

            mark     = '<C-x>',
            mark_all = '<C-a>',

            move_down  = '<C-n>',
            move_start = '',
            move_up    = '<C-p>',

            paste = '<C-r>',

            -- refine        = '<C-Space>',
            -- refine_marked = '<M-Space>',

            scroll_down  = '<C-e>',
            scroll_left  = '',
            scroll_right = '',
            scroll_up    = '<C-y>',

            stop = '<Esc>',

            toggle_info    = '<C-k>',
            toggle_preview = '<Tab>',
        },

        -- General options
        options = {
            -- Whether to show content from bottom to top
            content_from_bottom = false,

            -- Whether to cache matches (more speed and memory on repeated prompts)
            use_cache = false,
        },

        -- Window related options
        window = {
            -- Float window config (table or callable returning it)
            config = {
                -- relative = 'cursor', anchor = 'NW',
                -- row = 0, col = 0,
                width = vim.api.nvim_win_get_width(0),
                height = 8,
            },

            -- String to use as caret in prompt
            prompt_caret = '▏',

            -- String to use as prefix in prompt
            prompt_prefix = '> ',
        },
    },

    keys = {
        {
            "<leader>ff",
            "<cmd>Pick files<cr>",
            desc = "mini-pick files",
        },

        {
            "<leader>fb",
            "<cmd>Pick buffers<cr>",
            desc = "mini-pick buffers",
        },

        {
            "<leader>fg",
            "<cmd>Pick grep<cr>",
            desc = "mini-pick grep",
        },

        {
            "<leader>f/",
            "<cmd>Pick grep_live<cr>",
            desc = "mini-pick live-grep",
        },
    },
}

