return {
    "neovim/nvim-lspconfig", cond = true,
    lazy = true, event = { "BufReadPost", "BufWritePost", "BufNewFile" },

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp_lsp = require("cmp_nvim_lsp")

        local default_capabilities = vim.tbl_deep_extend( "force", {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        local servers = { "pyright", "marksman", "cmake", "bashls" }
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

        local disable_semantic_tokens = {
            lua = true,
            julia = true,
        }

        vim.diagnostic.config({
            virtual_text = {
                spacing = 4,
                -- source = "if_many", -- "always"
                prefix = '●', -- Could be '■', '▎', 'x'
            },

            float = {
                -- style = "minimal",
                header = "rustem, check this:", -- "Diagnostic:" (def)
            },
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")
                local opts = { buffer = 0, noremap = true, silent = true }

                -- follow Tj (1)
                local sets = servers[client.name]
                if type(sets) ~= "table" then
                    sets = {}
                end

                vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
                vim.opt_local.tagfunc = "v:lua.vim.lsp.tagfunc"


                -- vim.keymap.set('n', "gd", function() require("trouble").toggle("lsp_definitions") end)
                -- vim.keymap.set('n', "gr", function() require("trouble").toggle("lsp_references") end)
                -- vim.keymap.set('n', "gi", function() require("trouble").toggle("lsp_implementations") end)
                -- vim.keymap.set('n', "<space>D", vim.lsp.buf.type_definition, opts)
                -- vim.keymap.set('n', "<space>D", function() require("trouble").toggle("lsp_type_definitions") end)

                vim.keymap.set('n', "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set('n', "gr", vim.lsp.buf.references, opts)
                vim.keymap.set('n', "gD", vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', "<space>k", vim.lsp.buf.signature_help, opts)

                vim.keymap.set('n', "<space>cn", vim.lsp.buf.rename, opts)
                vim.keymap.set('n', "<space>ca", vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', "<space>fs", vim.lsp.buf.document_symbol, opts)
                vim.keymap.set('n', "<space>fS", vim.lsp.buf.workspace_symbol, opts)

                vim.keymap.set('n', "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', "<space>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)

                vim.keymap.set('n', "<space>e", vim.diagnostic.open_float, opts)
                vim.keymap.set('n', "[d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', "]d", vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', "<space>q", vim.diagnostic.setloclist, opts)


                -- follow Tj (2)
                local filetype = vim.bo[bufnr].filetype
                if disable_semantic_tokens[filetype] then
                    client.server_capabilities.semanticTokensProvider = nil
                end

                -- follow Tj (3), override server capabilities
                if sets.server_capabilities then
                    for k, v in pairs(sets.server_capabilities) do

                        if v == vim.NIL then
                            ---@diagnostic disable-next-line: cast-local-type
                            v = nil
                        end

                        client.server_capabilities[k] = v
                    end
                end

            end,
        })

        local function toggle_diagnostics()
            return vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end
        vim.keymap.set('n', '<space>dt', toggle_diagnostics, { noremap = true, silent = true, desc = "Toggle vim diagnostics" })

    end,

}
