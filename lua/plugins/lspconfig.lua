return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" }, -- "LazyFile"

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
    },

    config = function()
        vim.diagnostic.config({
            virtual_text = {
                spacing = 4,
                -- source = "if_many",
                source = "always",
                prefix = '●', -- Could be '■', '▎', 'x'
            },

            float = { source = "always", },
        })

        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")
        local default_capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        local custom_on_attach = function(_, bufnr)
            local function buf_set_option(...)
                vim.api.nvim_buf_set_option(bufnr, ...)
            end
            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


            -- Attach mappings to buffer
            local opts = { buffer = bufnr, noremap = true, silent = true }

            vim.keymap.set('n', "gD", vim.lsp.buf.declaration, opts)

            vim.keymap.set('n', "gd", vim.lsp.buf.definition, opts)
            -- vim.keymap.set('n', "gd", function() require("trouble").toggle("lsp_definitions") end)

            vim.keymap.set('n', "gi", vim.lsp.buf.implementation, opts)
            -- vim.keymap.set('n', "gi", function() require("trouble").toggle("lsp_implementations") end)

            vim.keymap.set('n', "gr", vim.lsp.buf.references, opts)
            -- vim.keymap.set('n', "gr", function() require("trouble").toggle("lsp_references") end)

            vim.keymap.set('n', "<space>D", vim.lsp.buf.type_definition, opts)
            -- vim.keymap.set('n', "<space>D", function() require("trouble").toggle("lsp_type_definitions") end)

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', "<space><C-k>", vim.lsp.buf.signature_help, opts)

            vim.keymap.set('n', "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', "<space>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)

            vim.keymap.set({'n','v'}, "<space>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', "<space>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set('n', "<space>e", vim.diagnostic.open_float, opts)

            vim.keymap.set('n', "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', "]d", vim.diagnostic.goto_next, opts)
        end


        local servers = { "pyright", "julials", "marksman", "cmake" }
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                capabilities = default_capabilities,
                on_attach = custom_on_attach
            })
        end


        lspconfig["lua_ls"].setup({
            capabilities = default_capabilities,
            on_attach = custom_on_attach,
            settings = {
                Lua = {
                    runtime = { version = "Lua 5.1" },
                    diagnostics = {
                        globals = { "vim", "it", "decribe", "before_each", "after_each" },
                    },
                    workspace = { library = { vim.env.VIMRUNTIME, } },
                }
            }
        })

        lspconfig['clangd'].setup({
            capabilities = {
                offsetEncoding = { "utf-16" },
            },
            on_attach = custom_on_attach,
            -- keys = {
            --     { "<space>gs", "<cmd>ClangdSwitchSourceHeader<cr>",
            --         desc = "Switch Source/Header (C/C++)" },
            -- },
            root_dir = function(fname)
                return
                    require("lspconfig.util").root_pattern(
                        "Makefile",
                        "configure.ac",
                        "configure.in",
                        "config.h.in",
                        "meson.build",
                        "meson_options.txt",
                        "build.ninja"
                    )(fname)
                    or
                    require("lspconfig.util").root_pattern(
                        "compile_commands.json",
                        "compile_flags.txt"
                    )(fname)
                    or
                    require("lspconfig.util").find_git_ancestor(fname)
            end,
            cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=iwyu",
                "--completion-style=detailed",
                "--function-arg-placeholders",
                "--fallback-style=llvm",
            },
            init_options = {
                usePlaceholders = true,
                completeUnimported = true,
                clangdFileStatus = true,
            },
        })

        lspconfig['texlab'].setup({
            capabilities = default_capabilities,
            on_attach = custom_on_attach,
            settings = {
                texlab = {
                    diagnostics = {
                        ignoredPatterns = { "Overfull" }
                    }
                }
            }
        })

        lspconfig['bashls'].setup({
            capabilities = default_capabilities,
            on_attach = custom_on_attach,
        })
    end,
}
