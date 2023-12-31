-- ---------------------------------------------------------
                       -- https://github.com/folke/lazy.nvim
-- ---------------------------------------------------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- ---------------------------------------------------------
local plugins = {
                                                -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            "nvim-tree/nvim-web-devicons"
        }
    },

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
    },

-- ---------------------------------------------------------
                                                      -- LSP
    {
        'williamboman/mason.nvim',
        config = function() require('mason').setup() end,
    },

    {
        'williamboman/mason-lspconfig.nvim',
        config = function() require('mason-lspconfig').setup() end,
    },

    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
        },
    },

                                           -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp", lazy = false },
            { 'hrsh7th/cmp-buffer',   lazy = false },
            { 'hrsh7th/cmp-path',     lazy = false },
            { 'hrsh7th/cmp-cmdline',  lazy = false },
            { 'hrsh7th/cmp-nvim-lua', lazy = false },
            { 'onsails/lspkind.nvim', lazy = false },
                                                 -- Snippets
            { 'L3MON4D3/LuaSnip' },
        },
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        event = "InsertEnter",
        dependencies = {
            { 'saadparwaiz1/cmp_luasnip',     lazy = false },
            { 'rafamadriz/friendly-snippets', lazy = false },
        }
    },

-- ---------------------------------------------------------
                                                      -- C++
    { 'p00f/clangd_extensions.nvim' },

-- ---------------------------------------------------------
                                               -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        build = ':TSUpdate'
    },

    { 'nvim-treesitter/playground' },
    -- { 'nvim-treesitter/nvim-treesitter-context' },

-- ---------------------------------------------------------
                             -- Debug Adapter Protocol (DAP)
    { 'mfussenegger/nvim-dap', },

    { 'rcarriga/nvim-dap-ui', },

    { 'theHamsta/nvim-dap-virtual-text' },

    { 'nvim-telescope/telescope-dap.nvim' },
-- ---------------------------------------------------------
                                                      -- Git
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },

-- ---------------------------------------------------------
                                                -- Expanding
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true
    },

    { 'tpope/vim-vinegar' },

    { 'ThePrimeagen/harpoon', branch = 'harpoon2' },

    {
        'numToStr/Comment.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        lazy = false,
        config = function() require('Comment').setup() end
    },

    { 'phaazon/hop.nvim', branch = 'v2' },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },

    { 'mbbill/undotree' },

    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = true,
    },

    -- { 'christoomey/vim-tmux-navigator' },

    { 'lervag/vimtex' },

    { 'lyokha/vim-xkbswitch' },

-- ---------------------------------------------------------
                                                     --  GUI
    {
        "utilyre/barbecue.nvim",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        },
        config = false,
        -- config = function() require('barbecue').setup() end,
        -- cond = false,
        -- init = function() print("HELLO FROM BARBECUE!") end,
    },

    { 'folke/zen-mode.nvim' },

    { 'nvim-lualine/lualine.nvim' },

-- ---------------------------------------------------------
                                                   -- Colors
-- assert(lazy == false) if this is my main colorsheme
--                       it makes it load durign startup
    {
        'ellisonleao/gruvbox.nvim',
        lazy = true, priority = 1000,
        config = function() require('gruvbox') end
    },

    {
        'rose-pine/neovim', name = 'rose-pine',
        lazy = true, priority = 1000,
    },

    {
        'metalelf0/jellybeans-nvim',
        lazy = false, priority = 1000,
        dependencies = { 'rktjmp/lush.nvim' },
        config = function()
            vim.cmd([[colorscheme jellybeans-nvim]])
        end,
    },

-- ---------------------------------------------------------
                                                 -- Markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = {
            "MarkdownPreviewToggle",
            "MarkdownPreview",
            "MarkdownPreviewStop"
        },
        build = "cd app && yarn install",
        ft = { "markdown" },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
    },
}
-- ---------------------------------------------------------
local opts = {}
-- ---------------------------------------------------------
-- ---------------------------------------------------------
                                   -- Bootstraping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- ---------------------------------------------------------
-- ---------------------------------------------------------
require("lazy").setup(plugins, opts)
