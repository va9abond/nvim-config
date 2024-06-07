return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" }, -- "LazyFile"

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "hrsh7th/nvim-cmp", cond = true },
    },

    config = function()
        vim.diagnostic.config({
            virtual_text = {
                spacing = 4,
                source = "if_many", -- "always"
                prefix = '●', -- Could be '■', '▎', 'x'
            },

            float = { source = "if_many", },
        })

        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")
        local default_capabilities = vim.tbl_deep_extend( "force", {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        local servers = { "pyright", "julials", "marksman", "cmake" }
        for _, lsp_server in ipairs(servers) do
            lspconfig[lsp_server].setup({
                capabilities = default_capabilities,
            })
        end

        lspconfig["lua_ls"].setup({
            capabilities = default_capabilities,
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

        lspconfig["clangd"].setup({
            capabilities = {
                offsetEncoding = { "utf-16" },
            },
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

        lspconfig["texlab"].setup({
            capabilities = default_capabilities,
            settings = {
                texlab = {
                    diagnostics = {
                        ignoredPatterns = { "Overfull" }
                    }
                }
            }
        })

        lspconfig["bashls"].setup({
            capabilities = default_capabilities,
        })


        local disable_semantic_tokens = {
            lua = true,
        }

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
                local opts = { buffer = 0}
                -- local opts = { buffer = 0, noremap = true, silent = true }

                vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
                vim.opt_local.tagfunc = "v:lua.vim.lsp.tagfunc"



                vim.keymap.set('n', "gd", vim.lsp.buf.definition, opts)
                -- vim.keymap.set('n', "gd", function() require("trouble").toggle("lsp_definitions") end)

                vim.keymap.set('n', "gr", vim.lsp.buf.references, opts)
                -- vim.keymap.set('n', "gr", function() require("trouble").toggle("lsp_references") end)

                vim.keymap.set('n', "gi", vim.lsp.buf.implementation, opts)
                -- vim.keymap.set('n', "gi", function() require("trouble").toggle("lsp_implementations") end)

                -- vim.keymap.set('n', "<space>D", vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set('n', "<space>D", function() require("trouble").toggle("lsp_type_definitions") end)

                -- vim.keymap.set('n', "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', "<space>k", vim.lsp.buf.signature_help, opts)

                vim.keymap.set('n', "<space>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set('n', "<space>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', "<space>e", vim.diagnostic.open_float, opts)

                vim.keymap.set('n', "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', "]d", vim.diagnostic.goto_next, opts)

                -- Somnitelno no OK
                vim.keymap.set('n', "<space>fs", vim.lsp.buf.document_symbol, opts)
                vim.keymap.set('n', "<space>fS", vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set('n', "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)


                local filetype = vim.bo[bufnr].filetype
                if disable_semantic_tokens[filetype] then
                    client.server_capabilities.semanticTokensProvider = nil
                end
            end,
        })

    end,
}
