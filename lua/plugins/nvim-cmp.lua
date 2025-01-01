return {
    "hrsh7th/nvim-cmp", cond = true, version = false,
    lazy = true, event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
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
                { name = "buffer", keyword_length = 4 },
                { name = "path" },
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
                    },
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
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
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            view = { entries = "wildmenu" },
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "buffer", keyword_length = 4 }
            })
        })

    end,
}
