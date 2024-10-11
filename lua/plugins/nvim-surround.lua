return {
    "kylechui/nvim-surround", cond = true,
    lazy = true, event = "VeryLazy",
    version = "*",
    opts = { -- h: nvim-surround.txt
        keymaps = {
            insert = false,
            insert_line = false,
            normal = "ys",
            normal_cur = "yss",
            normal_line = false,
            normal_cur_line = false,
            visual = "<C-x>",
            visual_line = false,
            delete = "ds",
            change = "cs",
            change_line = false,
        },

        indent_lines = false,
        move_cursor = false,

        -- keymaps        -- Defines plugin keymaps
        -- surrounds      -- Defines surround keys and behavior
        -- aliases        -- Defines aliases
        -- highlight      -- Defines highlight behavior
        -- move_cursor    -- Defines cursor behavior
        -- indent_lines   -- Defines line indentation behavior
    }
}
