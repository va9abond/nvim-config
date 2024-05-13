return {
    "echasnovski/mini.surround", cond = false,
    lazy = true, event = "VeryLazy",
    version = false,

    opts = {
        highlight_duration = 2000,
        mappings = {
            -- TODO: change mapping for add surround to not conflict with yank
            add = 'ys', -- Add surrounding in Normal and Visual modes
            delete = 'ds', -- Delete surrounding
            find = '', -- Find surrounding (to the right)
            find_left = '', -- Find surrounding (to the left)
            highlight = '', -- Highlight surrounding
            replace = 'cs', -- Replace surrounding
            update_n_lines = '', -- Update `n_lines`

            suffix_last = '', -- Suffix to search with "prev" method
            suffix_next = '', -- Suffix to search with "next" method
        },
    }
}

-- The problem is that I can't manage mappings in different modes specially
-- in visual mode. When I want a copy in visual mode and press 'y' there is
-- a delay - 1) I really want to yank or 2) I want surroundings
