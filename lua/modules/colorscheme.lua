-- assert(lazy == false) if this is my main colorsheme
--                       it makes it load durign startup
-- ---------------------------------------------------------
local _colors_list =
{
    black = '#000000',
    green = '#114538',
    white = '#edede8',
}
-- ---------------------------------------------------------
return {
    {
        "ellisonleao/gruvbox.nvim", enabled = false,
        lazy = true, priority = 1000,
        opts = {
            terminal_colors = true,
            undercurl = true,
            underline = true,
            bold = true,

            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },

            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "", -- can be "hard", "soft" or empty string

            palette_overrides = {
                dark0 = _colors_list.black,
            },

            overrides = {},
            dim_inactive = false,
            transparent_mode = false,
        }
    },

    {
        "rose-pine/neovim", name = "rose-pine", enabled = false,
        lazy = true, priority = 1000,
        opts = {
            --- @usage 'auto'|'main'|'moon'|'dawn'
            variant = 'main',
            --- @usage 'main'|'moon'|'dawn'
            dark_variant = 'main',
            bold_vert_split = true,
            dim_nc_background = false,
            disable_background = true,
            disable_float_background = false,
            disable_italics = false,

            --- @usage string hex value or named color from rosepinetheme.com/palette
            groups = {
                background = _colors_list.black,
                background_nc = 'nc',
                panel = 'surface',
                panel_nc = 'base',
                border = 'highlight_med',
                comment = 'muted',
                link = 'iris',
                punctuation = 'love',
                error = 'love',
                hint = 'iris',
                info = 'foam',
                warn = 'gold',
                git_add = 'foam',
                git_change = 'rose',
                git_delete = 'love',
                git_dirty = 'rose',
                git_ignore = 'muted',
                git_merge = 'iris',
                git_rename = 'pine',
                git_stage = 'iris',
                git_text = 'rose',
                headings = {
                    h1 = 'iris',
                    h2 = 'foam',
                    h3 = 'rose',
                    h4 = 'gold',
                    h5 = 'pine',
                    h6 = 'foam',
                },

                -- or set all headings at once
                -- headings = 'subtle'
            },

            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = 'overlay', blend = 10 },

                -- Blend colours against the "base" background
                CursorLine = { bg = 'overlay', blend = 20 },
                StatusLine = { fg = 'text', bg = _colors_list.black, },

                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                Search = { bg = _colors_list.green, inherit = false },
            }
        }
    },

    {
        "metalelf0/jellybeans-nvim", enabled = false,
        lazy = false, priority = 1000,
        config = function()
            vim.cmd.colorscheme("jellybeans-nvim")
        end,
        dependencies = { "rktjmp/lush.nvim" }
    },

    { "vim-scripts/hornet.vim", enabled = false,
        lazy = false, priority = 1000,
        config = function()
            vim.cmd.colorscheme("hornet")
        end,
    },

    { "jnurmine/Zenburn", enabled = false,
        lazy = false, priority = 1000,
        config = function()
            vim.cmd.colorscheme("jellybeans-nvim")
        end,
    },

    {
        "vim-scripts/less.vim", enabled = false,
        lazy = false, priority = 1000,
        config = function()
            vim.cmd.colorscheme("colorscheme less")
        end,
    },

    {
        "thimc/gruber-darker.nvim", enabled = false,
        name = "thimc-gruber-darker",
        lazy = false, priority = 1000,
        config = function()
            require("gruber-darker").setup({
                transparent = false, -- removes the background
                underline = true,    -- disables underline fonts
                bold = true,         -- disables bold fonts
            })
            vim.cmd.colorscheme("gruber-darker")
        end,
    },

    {
        "blazkowolf/gruber-darker.nvim", enabled = true,
        name = "blazkowolf-gruber-darker",
        lazy = false, priority = 1000,
        config = function()
            require("gruber-darker").setup({
                bold = true,
                invert = {
                    signs = false,
                    tabline = false,
                    visual = false,
                },
                italic = {
                    strings = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                undercurl = true,
                underline = true,
            })
            vim.cmd.colorscheme("gruber-darker")
        end,
    },

    {
        "va9abond/gruber-extended.nvim", enabled = false,

        url = "git@github.com:va9abond/gruber-extended.nvim.git",
        dir = "~/gitlocal/gruber-extended.nvim",
        lazy = false, priority = 1000,

        config = function()
            require("gruber-darker").setup({
                bold = true,

                invert = {
                    signs = false,
                    tabline = false,
                    visual = false,
                },

                italic = {
                    strings = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },

                undercurl = false,
                underline = false,
            })
            vim.cmd.colorscheme("gruber-darker")
        end,
    },

    {
        "rktjmp/lush.nvim", enabled = true,
        lazy = false
    }
}
