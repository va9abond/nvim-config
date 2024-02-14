local plugins_table = {
------------------------------------------------------------
                                             -- plenary.nvim
    {
        "nvim-lua/plenary.nvim", cond = true, lazy = true
    },

    {
        "nvim-tree/nvim-web-devicons", cond = true, lazy = true
    },


------------------------------------------------------------
                                                      -- LSP
-- i.   https://github.com/williamboman/mason.nvim
-- ii.  https://github.com/williamboman/mason-lspconfig.nvim
-- iii. https://github.com/neovim/nvim-lspconfig

    {
        "williamboman/mason.nvim", enabled = true, lazy = true,
        config = true, cmd = "Mason",
    },

    {
        "williamboman/mason-lspconfig.nvim", enabled = true, lazy = false,
        opts = {
            automatic_installation = true,
            ensure_installed = {
                "clangd", -- tag example: "clangd@16.0.2",
                "cmake",
                "lua_ls",
                "julials",
                "texlab",
                "pyright",
            },
        },
    },

    {
        "neovim/nvim-lspconfig", enabled = true, lazy = true,
        event = { "BufReadPost", "BufWritePost", "BufNewFile" }, -- "LazyFile"
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("plugins.config.lsp.lspconfig")
        end,
    },


------------------------------------------------------------
                                           -- Autocompletion


------------------------------------------------------------
                                                      -- DAP


------------------------------------------------------------
                                               -- Treesitter
   {
       "nvim-treesitter/nvim-treesitter", cond = true, lazy = true,
       build = ":TSUpdate", version = false,
       event = { "BufReadPost", "BufWritePost", "BufNewFile" , "VeryLazy" },
       cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
       config = function()
           require("plugins.config.treesitter")
       end,
   },

------------------------------------------------------------
                                                -- Telescope


------------------------------------------------------------
                                                    -- Other
    {
        "numToStr/Comment.nvim", cond = true, lazy = true,
        event = { "VeryLazy" },
        config = true
    },

    {
        "p00f/clangd_extensions.nvim", cond = true, lazy = true,
        config = function()
            require("plugins.config.clangd_extensions")
        end,
    },

    {
        "ThePrimeagen/harpoon", cond = true, lazy = false,
        branch = "master",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("plugins.config.harpoon")
        end,
    },

    {
        "phaazon/hop.nvim", cond = false, lazy = true,
        event = "VeryLazy",
        branch = "v2",

        opts = {
            keys = "eovqpdgflhckisuran",
        },

        keys = {
            { "<space>h", "<cmd>HopWord<cr>", 'n' },
            { "<space>l", "<cmd>HopLine<cr>", 'n' },
        },
    },


------------------------------------------------------------
                                              -- Colorscheme
    -- lazy = true, priority = 1000 (should be for main colorscheme)
    { -- TODO change opts to separate config
        "rose-pine/neovim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        name = "rose-pine",
        opts = {
            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = "overlay", blend = 10 },

                -- Blend colours against the "base" background
                CursorLine = { bg = "overlay", blend = 20 },
                StatusLine = { fg = "text", bg = "#000000" },

                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                Search = { bg = "#114538", inherit = false },
            },
        },
    },

    {
        "metalelf0/jellybeans-nvim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        dependencies = { "rktjmp/lush.nvim" },
    },

    {
        dir = "~/gitlocal/colors.nvim", enabled = true,
        lazy = false, priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },

        config = function()
            vim.cmd.colorscheme("custom")
        end,
    },

    {
        "blazkowolf/gruber-darker.nvim", cond = true,
        lazy = true, --[[ priority = 1000, ]]
        name = "blazkowolf-gruber-darker",
        config = function()
            require("plugins.config.gruber-darker")
        end
    },
}


return plugins_table
