return {
    "ibhagwan/fzf-lua", cond = true, lazy = false,

    opts = {
        winopts = {
            split = "belowright new", -- open in a split instead?
            -- "belowright new"  : split below
            -- "aboveleft new"   : split above
            -- "belowright vnew" : split right
            -- "aboveleft vnew   : split left

            -- Only valid when using a float window
            -- (i.e. when 'split' is not defined, default)
            height           = 10,            -- window height
            width            = 1,            -- window width
            row              = 1,            -- window row position (0=top, 1=bottom)
            col              = 0,            -- window col position (0=left, 1=right)
                            -- { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
            border           = { " ", "─", " ", " ", " ", " ", " ", " " },
            backdrop         = 100, -- 0 = opaque, 100 = transparent
            -- title         = "Title",
            -- title_pos     = "center",        -- 'left', 'center' or 'right'
            -- title_flags   = false,           -- uncomment to disable title flags
            fullscreen       = false,           -- start fullscreen?
            -- enable treesitter highlighting for the main fzf window will only have
            -- effect where grep like results are present, i.e. "file:line:col:text"
            -- due to highlight color collisions will also override `fzf_colors`
            -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
            treesitter       = {
                enabled    = true,
                fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
            },
            preview = {
                hidden = true,           -- start preview hidden
                title  = false,            -- preview border title (file/buf)?
            },
            on_create = function()
                vim.api.nvim_win_set_height(0, 9)
                -- called once upon creation of the fzf main window
            end,
            -- on_close = function()
            --     -- called once _after_ the fzf interface is closed
            -- end
        },

        keymap = {
            builtin = { },
            fzf = { },
        },

        actions = { },
        fzf_opts = {
            -- options are sent as `<left>=<right>`
            -- set to `false` to remove a flag
            -- set to `true` for a no-value flag
            -- for raw args use `fzf_args` instead
            ["--ansi"]           = true,
            ["--info"]           = "inline-right",
            ["--height"]         = "100%",
            ["--layout"]         = "reverse",
            ["--border"]         = "none",
            ["--highlight-line"] = true,
        },

        fzf_colors = { },  -- Fzf `--color` specification
        hls = { },         -- Highlights
        previewers = { },  -- Previewers options
    },

    keys = {
        { '<leader>ff', '<cmd>FzfLua files resume=false<cr>', mode = 'n' },
        { '<leader>fb', '<cmd>FzfLua buffers<cr>', mode = 'n' },
        { '<C-x>b', '<cmd>FzfLua buffers<cr>', mode = 'n' },
        { '<leader>fg', '<cmd>FzfLua grep<cr>', mode = 'n' },
        { '<C-x>g', '<cmd>FzfLua grep<cr>', mode = 'n' },
        -- { '<leader>fs', '<cmd>FzfLua lgrep_curbuf<cr>', mode = n },
        -- { '<leader>fo', '<cmd>FzfLua oldfiles<cr>', mode = 'n' },
        -- { '<leader>fg', '<cmd>FzfLua grep resume=true<cr>', mode = 'n' },
        -- { '<leader>f',  '<cmd>FzfLua resume<cr>', mode = 'n' },
        { '<leader>/', '<cmd>FzfLua grep_curbuf resume=true<cr>', mode = 'n' },
        -- { '<C-x>f', '<cmd>FzfLua files<cr>', mode = 'n' },
        { '<leader>ft', '<cmd>FzfLua tags<cr>', mode = 'n' },
        { '<C-x>s', '<cmd>FzfLua lsp_document_symbols resume=true<cr>', mode = 'n' },
        { '<C-x>S', '<cmd>FzfLua lsp_workspace_symbols resume=true<cr>', mode = 'n' },
        -- { '<C-x>S',     '<cmd>FzfLua lsp_workspace_symbols resume=true<cr>', mode = 'n' },
    }
}
