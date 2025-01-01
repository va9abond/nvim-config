return {
    "hrsh7th/nvim-cmp", cond = false, version = false,
    lazy = true, event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "micangl/cmp-vimtex",
    },

    config = function()
        local cmp = require("cmp")

        vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
        vim.opt.shortmess:append("c")

        cmp.setup({
            sources = {
                -- { name = "server_name", max_item_count = 9, keyword_length = 3, priority = 1},
                { name = "nvim_lsp", keyword_length = 4, priority = 99 },
                { name = "nvim_lsp_signature_help" },
                { name = "buffer", keyword_length = 4 },
                { name = "path" },
                { name = "luasnip", show_autosnippets = false },
            },

            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                ["<C-Space>"] = cmp.mapping.close(),
                ["<C-e>"] = cmp.mapping.abort(),
            },

            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "text", -- "text" | "symbol" | "text_symbol"
                    menu = {
                        nvim_lsp      = "[LSP]",
                        buffer        = "[Buf]",
                        path          = "[Path]",
                        cmdline       = "[Cmd]",
                        luasnip       = "[Snip]"
                    },
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
                { name = "buffer" },
            })
        })

        cmp.setup.filetype("tex", {
            sources = cmp.config.sources({
                { name = "vimtex" },
                { name = "buffer" },
                { name = "path" },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            view = { entries = "wildmenu" },
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "nvim_lsp_document_symbol" },
                { name = "buffer", keyword_length = 4 }
            })
        })

        cmp.setup.cmdline(':', {
            view = { entries = "wildmenu" },
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "cmdline", keyword_length = 4 },
                { name = "path" },
            })
        })
    end,
}
