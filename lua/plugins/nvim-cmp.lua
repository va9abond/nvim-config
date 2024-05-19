return {
    "hrsh7th/nvim-cmp", cond = true, --[[ lazy = true, ]]
    event = { "InsertEnter", "CmdlineEnter" },
    version = false,

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "micangl/cmp-vimtex",
        "saadparwaiz1/cmp_luasnip",
        -- "p00f/clangd_extensions.nvim",
        "onsails/lspkind.nvim",
    },

    config = function()
        vim.opt.completeopt = { "menu", "menuone", "preview", "noselect" }
        vim.opt.shortmess:append("c")

        local cmp = require("cmp")
        cmp.setup({
            -- window = {
            --     completion = cmp.config.window.bordered(),
            --     documentation = cmp.config.window.bordered(),
            -- },

            sources = {
                -- { name = "server_name", max_item_count = 9, keyword_length = 3 },
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "luasnip" },
                { name = "nvim_lua" },
                { name = "vimtex" },
                { name = "path" },
                { name = "buffer", keyword_length = 3 },
            },

            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                -- ["<C-y>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
                ["<C-Space>"] = cmp.mapping.close(),
                ["<C-e>"] = cmp.mapping.abort(),
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            -- sorting = {
            --     comparators = {
            --         cmp.config.compare.offset,
            --         cmp.config.compare.exact,
            --         cmp.config.compare.score,
            --         cmp.config.compare.recently_used,
            --
            --         -- require("clangd_extensions.cmp_scores"),
            --
            --         cmp.config.compare.kind,
            --         cmp.config.compare.sort_text,
            --         cmp.config.compare.length,
            --         cmp.config.compare.order,
            --     },
            -- },

            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "text", -- "text" | "symbol" | "text_symbol"
                    menu = {
                        nvim_lsp      = "[LSP]",
                        nvim_lsp_signature_help = "[...]",
                        buffer        = "[Buf]",
                        path          = "[Path]",
                        cmdline       = "[Cmd]",
                        luasnip       = "[Snip]",
                        nvim_lua      = "[API]",
                        latex_symbols = "[LaTex]"
                    },
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
            },
        })

        cmp.setup.filetype("gitcommit", {
            sources = {
                { name = "git" },
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                -- { name = "cmdline", max_item_count = 13 }
                { name = "cmdline" },
                { name = "path" },
            }
        })

        cmp.setup.filetype("tex", {
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "vimtex" },
                { name = "buffer" },
                { name = "path" },
            },
        })
    end,
}
