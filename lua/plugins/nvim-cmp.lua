return {
    "hrsh7th/nvim-cmp", cond = true, lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    version = false,

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        -- "saadparwaiz1/cmp_luasnip",
        "micangl/cmp-vimtex",
        "onsails/lspkind.nvim",
    },

    config = function()
        vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
        vim.opt.shortmess:append("c")

        local cmp = require("cmp")
        cmp.setup({
            sources = {
                -- { name = "server_name", max_item_count = 9, keyword_length = 3 },
                { name = "nvim_lsp", keyword_length = 4 },
                { name = "nvim_lsp_signature_help" },
                { name = "path" },
                { name = "buffer", keyword_length = 4 },
            },

            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
                ["<C-Space>"] = cmp.mapping.close(),
                ["<C-e>"] = cmp.mapping.abort(),
            },

            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "text", -- "text" | "symbol" | "text_symbol"
                    menu = {
                        nvim_lsp      = "[LSP]",
                        nvim_lsp_signature_help = "[SGN]",
                        buffer        = "[Buf]",
                        path          = "[Path]",
                        cmdline       = "[Cmd]",
                    },
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
            },
        })

        cmp.setup.filetype("gitcommit", {
            -- completion = { autocomplete = true, },
            sources = {
                { name = "git" },
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer", keyword_length = 4 }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "cmdline", keyword_length = 4 },
                { name = "path" },
            }
        })

        cmp.setup.filetype("tex", {
            sources = {
                { name = "nvim_lsp" },
                { name = "vimtex" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
