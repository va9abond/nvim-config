return {
    "hrsh7th/nvim-cmp", cond = true, lazy = true,
    event = { "InsertEnter" },
    version = false,

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        "p00f/clangd_extensions.nvim",
        "onsails/lspkind.nvim",
    },

    config = function()
        local cmp = require("cmp")

        cmp.setup({
            -- completion = {
            --     completopt = "menu,menuone,noinsert",
            -- },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            view = {
                entries = "custom", -- opts: custom / wildmenu / native
            },
        ------------------------------------------------------------
                                          -- Completion float window
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },

        ------------------------------------------------------------
                                                          -- Mapping
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
            }),
        ------------------------------------------------------------
                                                          -- Sources
            sources = cmp.config.sources(
                {
                    -- { name = "server_name", max_item_count = 9, keyword_length = 3 },
                    { name = "nvim_lua" },
                    { name = "vimtex" },
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "treesitter" },
                },
                {
                    { name = "path" },
                    { name = "buffer", max_item_count = 5, keyword_length = 3 },
                }
            ),
        ------------------------------------------------------------
                                                          -- Sorting
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,

                    require("clangd_extensions.cmp_scores"),

                    function(entry1, entry2)
                        local _, entry1_under = entry1.completion_item.label:find "^_+"
                        local _, entry2_under = entry2.completion_item.label:find "^_+"
                        entry1_under = entry1_under or 0
                        entry2_under = entry2_under or 0
                        if entry1_under > entry2_under then
                            return false
                        elseif entry1_under < entry2_under then
                            return true
                        end
                    end,

                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },
        ------------------------------------------------------------
                                                          -- lspking
            formatting = {
                format = require("lspkind").cmp_format({
                    mode = "text", -- text | symbol | text_symbol
                    menu = {
                        buffer        = "[Buf]",
                        path          = "[Path]",
                        cmdline       = "[Cmd]",
                        luasnip       = "[Snip]",
                        nvim_lua      = "[API]",
                        vim_tex       = "[Vimtex]",
                        latex_symbols = "[Latex]",
                        treesitter    = "[TRS]",
                        nvim_lsp      = "[LSP]",
                    },
                    maxwidth = 30,
                    ellipsis_char = "...",
                }),
            },
        })
        ------------------------------------------------------------
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })
        ------------------------------------------------------------
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })
        ------------------------------------------------------------
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline({
                ['<CR>'] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                -- { name = 'cmdline', max_item_count = 13 }
                { name = 'cmdline' }
            })
        })
        ------------------------------------------------------------
    end,
}
