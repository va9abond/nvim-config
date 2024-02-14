local c = {
    black       = "#000000",
    white       = "#ffffff",
    grey        = "#888888",
}

local custom = {
    normal = {
        a = { bg = c.black, fg = c.grey },
        b = { bg = c.black, fg = c.grey },
        c = { bg = c.black, fg = c.grey },
        x = { bg = c.black, fg = c.grey },
        y = { bg = c.black, fg = c.grey },
        z = { bg = c.black, fg = c.grey },
    },

    insert = {
        a = { bg = c.black, fg = c.grey },
        b = { bg = c.black, fg = c.grey },
        c = { bg = c.black, fg = c.grey },
        x = { bg = c.black, fg = c.grey },
        y = { bg = c.black, fg = c.grey },
        z = { bg = c.black, fg = c.grey },
    },

    visual = {
        a = { bg = c.black, fg = c.grey },
        b = { bg = c.black, fg = c.grey },
        c = { bg = c.black, fg = c.grey },
        x = { bg = c.black, fg = c.grey },
        y = { bg = c.black, fg = c.grey },
        z = { bg = c.black, fg = c.grey },
    },

    replace = {
        a = { bg = c.black, fg = c.grey },
        b = { bg = c.black, fg = c.grey },
        c = { bg = c.black, fg = c.grey },
        x = { bg = c.black, fg = c.grey },
        y = { bg = c.black, fg = c.grey },
        z = { bg = c.black, fg = c.grey },
    },

    command = {
        a = { bg = c.black, fg = c.white, gui = "bold" },
        b = { bg = c.black, fg = c.grey },
        c = { bg = c.black, fg = c.grey },
        x = { bg = c.black, fg = c.grey },
        y = { bg = c.black, fg = c.grey },
        z = { bg = c.black, fg = c.grey },
    },

    innactive = {
        a = { bg = c.black, fg = c.grey },
        b = { bg = c.black, fg = c.grey },
        c = { bg = c.black, fg = c.grey },
        x = { bg = c.black, fg = c.grey },
        y = { bg = c.black, fg = c.grey },
        z = { bg = c.black, fg = c.grey },
    },
}


return {
    "nvim-lualine/lualine.nvim", cond = true, lazy = true,
    event = "VeryLazy",

    opts = {
        options = {
            icons_enabled = true,
            theme = custom,

            disabled_filetypes = {
                statusline = {
                    "dashboard", "alpha", "starter", "pdf", "aerial",
                    "Trouble", "undotree", "diff", "git", "NvimTree"
                },
            },

            component_separators = { left = "", right = ""},
            section_separators = { left = "", right = ""},
            -- When set to true, left sections i.e. 'a','b' and 'c'
            -- can't take over the entire statusline even
            -- if neither of 'x', 'y' or 'z' are present.
            always_divide_middle = true,

            -- Enable global statusline (have a single statusline
            -- at bottom of neovim instead of one for  every window).
            -- This feature is only available in neovim 0.7 and higher.
            globalstatus = true,

            refresh = {              -- sets how often lualine should refresh it's contents (in ms)
                statusline = 1000,   -- The refresh option sets minimum time that lualine tries
                tabline = 1000,      -- to maintain between refresh. It's not guarantied if situation
                winbar = 1000        -- arises that lualine needs to refresh itself before this time
                                     -- it'll do it.
            },
        },

        sections = {
            lualine_a = { "branch" },
            lualine_b = { {"filename", path = 4} },
            lualine_c = { "diff", "diagnostics" },
            lualine_x = { "aerial" },
            lualine_y = { "location" }, -- fileformat | filetype | encoding
            lualine_z = { "progress" }
        },

        inactive_sections = {
            lualine_a = { "branch" },
            lualine_b = { "filename" },
            lualine_c = { "diff" },
            lualine_x = { },
            lualine_y = { },
            lualine_z = { }
        },

        -- winbar | inactive_winbar
    },
}
