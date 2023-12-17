-- ---------------------------------------------------------
                      -- https://github.com/hrsh7th/nvim-cmp
                               -- Great Thanks to TJ DeVries
              -- https://www.youtube.com/watch?v=_DnmphIwnjo
-- ---------------------------------------------------------
return {
    "hrsh7th/nvim-cmp",

    version = false,
    event = { "InsertEnter", "CmdlineEnter" },

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lua",
        "saadparwaiz1/cmp_luasnip",
        "p00f/clangd_extensions.nvim",
        "onsails/lspkind.nvim",
    },

    opts = function()
        -- vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local cmp = require("cmp")

        return {
            completion = {
                completopt = "menu,menuone,noinsert",
            },

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            view = {
                entries = "custom", -- opts: custom / wildmenu / native
            },
                                           -- Completion window view
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },

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

-- https://www.youtube.com/watch?v=1K1bNTOQi5g&list=PLOe6AggsTaVuIXZU4gxWJpIQNHMrDknfN&index=43
            sources = cmp.config.sources(
                {
                    { name = "nvim_lua", max_item_count = 13 },
                    { name = "vimtex",   max_item_count = 5  },
                    { name = "nvim_lsp", max_item_count = 5  },
                    { name = "luasnip",  max_item_count = 8  },
                    { name = "treesitter" },
                },
                {
                    { name = "path"     },
                    { name = "buffer", max_item_count = 3, keyword_length = 3 },
                }
            ),

            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    cmp.config.compare.recently_used,

                    require("clangd_extensions.cmp_scores"),

                    -- Thanks to TJ DeVries
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
                        treesitter    = "[TS]",
                        nvim_lsp      = "[LSP]",
                    },
                    maxwidth = 25,
                    ellipsis_char = "...",
                }),
            },

            -- experimental = {
            --     ghost_text = {
            --         hl_group = "CmpGhostText",
            --     },
            -- },
        }
    end,

    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end

        require("cmp").setup(opts)

        local cmp = require('cmp')

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline({
                ['<CR>'] = cmp.mapping.confirm({ select = true })
            }),
            sources = cmp.config.sources({
                { name = 'path' },
            }, {
                { name = 'cmdline', max_item_count = 13 }
            })
        })
    end
}
