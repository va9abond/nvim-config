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
        -- "micangl/cmp-vimtex",
        "saadparwaiz1/cmp_luasnip",
        -- "p00f/clangd_extensions.nvim",
        "onsails/lspkind.nvim",
    },

    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            view = {
                entries = "custom", -- opts: custom / wildmenu / native
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
            }),

            sources = cmp.config.sources(
                {
                    -- { name = "server_name", max_item_count = 9, keyword_length = 3 },
                    { name = "nvim_lsp" },
                    { name = "nvim_lsp_signature_help" },
                    { name = "luasnip" },
                    { name = "nvim_lua" },
                },
                {
                    { name = "path" },
                    -- { name = "buffer", max_item_count = 5, keyword_length = 3 },
                    { name = "buffer", keyword_length = 3 },
                    { name = "vimtex" },
                }
            ),

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
                    mode = "text", -- text | symbol | text_symbol
                    menu = {
                        nvim_lsp      = "[LSP]",
                        nvim_lsp_signature_help = "[...]",
                        buffer        = "[Buf]",
                        path          = "[Path]",
                        cmdline       = "[Cmd]",
                        luasnip       = "[Snip]",
                        nvim_lua      = "[API]",
                        vimtex        = "[VimTex]"
                    },
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
            },
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "git" },
            }, {
                { name = "buffer" },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline({
                ["<CR>"] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                -- { name = "cmdline", max_item_count = 13 }
                { name = "cmdline" }
            })
        })

        cmp.setup.filetype("tex", {
            sources = {
                { name = 'vimtex' },
                { name = 'buffer' },
                -- other sources
            },
        })
    end,
}
