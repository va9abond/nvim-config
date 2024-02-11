local colors = {
    black       = '#000000',
    white       = '#ffffff',
    foreground  = '#e8e8d3',
    background  = '#151515',
    grey        = '#888888',
    grey_one    = '#1c1c1c',
    grey_two    = '#f0f0f0',
    grey_three  = '#333333',
    regent_grey = '#9098A0',
    scorpion    = '#606060',
    cod_grey    = '#101010',
    ship_cove   = '#8197bf'
}


local _mytheme = {
    normal = {
        a = { bg = colors.black, fg = colors.grey },
        b = { bg = colors.black, fg = colors.grey },
        c = { bg = colors.black, fg = colors.grey },
        x = { bg = colors.black, fg = colors.grey },
        y = { bg = colors.black, fg = colors.grey },
        z = { bg = colors.black, fg = colors.grey },
    },
    insert = {
        a = { bg = colors.black, fg = colors.grey },
        b = { bg = colors.black, fg = colors.grey },
        c = { bg = colors.black, fg = colors.grey },
        x = { bg = colors.black, fg = colors.grey },
        y = { bg = colors.black, fg = colors.grey },
        z = { bg = colors.black, fg = colors.grey },
    },
    visual = {
        a = { bg = colors.black, fg = colors.grey },
        b = { bg = colors.black, fg = colors.grey },
        c = { bg = colors.black, fg = colors.grey },
        x = { bg = colors.black, fg = colors.grey },
        y = { bg = colors.black, fg = colors.grey },
        z = { bg = colors.black, fg = colors.grey },
    },
    replace = {
        a = { bg = colors.black, fg = colors.grey },
        b = { bg = colors.black, fg = colors.grey },
        c = { bg = colors.black, fg = colors.grey },
        x = { bg = colors.black, fg = colors.grey },
        y = { bg = colors.black, fg = colors.grey },
        z = { bg = colors.black, fg = colors.grey },
    },
    command = {
        a = { bg = colors.black, fg = colors.white, gui = "bold" },
        b = { bg = colors.black, fg = colors.grey },
        c = { bg = colors.black, fg = colors.grey },
        x = { bg = colors.black, fg = colors.grey },
        y = { bg = colors.black, fg = colors.grey },
        z = { bg = colors.black, fg = colors.grey },
    },
    innactive = {
        a = { bg = colors.black, fg = colors.grey },
        b = { bg = colors.black, fg = colors.grey },
        c = { bg = colors.black, fg = colors.grey },
        x = { bg = colors.black, fg = colors.grey },
        y = { bg = colors.black, fg = colors.grey },
        z = { bg = colors.black, fg = colors.grey },
    },
}


return {
    "nvim-lualine/lualine.nvim", enabled = true,
    event = "VeryLazy",

    opts = function()
        return {
            options = {
                icons_enabled = true,
                theme = _mytheme,
                disabled_filetypes = {
                    statusline = {
                        "dashboard", "alpha", "starter", "pdf", "aerial",
                        "Trouble", "undotree", "diff", "git"
                    },
                    winbar = {},
                },
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                ignore_focus = {'NvimTree'},
                    -- If current filetype is in this list it'll
                    -- always be drawn as inactive statusline
                    -- and the last window will be drawn as active statusline.
                    -- for example if you don't want statusline of
                    -- your file tree / sidebar window to have active
                    -- statusline you can add their filetypes here.

                always_divide_middle = true,
                    -- When set to true, left sections i.e. 'a','b' and 'c'
                    -- can't take over the entire statusline even
                    -- if neither of 'x', 'y' or 'z' are present.

                globalstatus = false,
                    -- enable global statusline (have a single statusline
                    -- at bottom of neovim instead of one for  every window).
                    -- This feature is only available in neovim 0.7 and higher.

                refresh = {              -- sets how often lualine should refresh it's contents (in ms)
                    statusline = 1000,   -- The refresh option sets minimum time that lualine tries
                    tabline = 1000,      -- to maintain between refresh. It's not guarantied if situation
                    winbar = 1000        -- arises that lualine needs to refresh itself before this time
                                         -- it'll do it.
                },
            },

            sections = {
                lualine_a = {"branch"},
                lualine_b = {{"filename", path = 4}},
                lualine_c = {"diff", "diagnostics"},
                lualine_x = {"aerial"},
                lualine_y = {"location"}, -- fileformat | filetype | encoding
                lualine_z = {"progress"}
            },

            inactive_sections = {
                lualine_a = {"branch"},
                lualine_b = {"filename"},
                lualine_c = {"diff"},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },

            -- winbar | inactive_winbar

            extensions = {}
        }
    end,
}

