return {
    "neovim/nvim-lspconfig", cond = true,

    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'saghen/blink.cmp',
        { 'folke/lazydev.nvim', ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
    },

    config = function()
        local lspconfig = require('lspconfig')
        local blink_capabilities = require('blink.cmp').get_lsp_capabilities()

        local lsp_server_list = {
            'pyright',
            'cmake',
            'bashls',
            'marksman',
            -- 'julials',
        }
        for _, server in ipairs(lsp_server_list) do
            lspconfig[server].setup({
                capabilities = blink_capabilities,
            })
        end

        lspconfig.lua_ls.setup({
            capabilities = blink_capabilities,
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

        lspconfig.clangd.setup({
            capabilities = blink_capabilities,
            capabilities = { offsetEncoding = { "utf-16" }, },
            -- keys = {
            --     { "<space>gs", "<cmd>ClangdSwitchSourceHeader<cr>",
            --         desc = "Switch Source/Header (C/C++)" },
            -- },
            -- root_dir = function(fname)
            --     return
            --         require("lspconfig.util").root_pattern(
            --             "Makefile",
            --             "configure.ac",
            --             "configure.in",
            --             "config.h.in",
            --             "meson.build",
            --             "meson_options.txt",
            --             "build.ninja"
            --         )(fname)
            --         or
            --         require("lspconfig.util").root_pattern(
            --             "compile_commands.json",
            --             "compile_flags.txt"
            --         )(fname)
            --         or
            --         require("lspconfig.util").find_git_ancestor(fname)
            -- end,
            -- cmd = {
            --     "clangd",
            --     "--background-index",
            --     "--clang-tidy",
            --     "--header-insertion=iwyu",
            --     "--completion-style=detailed",
            --     "--function-arg-placeholders",
            --     "--fallback-style=llvm",
            -- },
            -- init_options = {
            --     usePlaceholders = true,
            --     completeUnimported = true,
            --     clangdFileStatus = true,
            -- },
        })

        lspconfig.texlab.setup({
            capabilities = blink_capabilities,
            settings = {
                texlab = {
                    diagnostics = {
                        ignoredPatterns = { "Overfull" }
                    }
                }
            }
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function(args)
                local bufnr = args.buf

                vim.bo[bufnr].formatexpr = nil
                vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
                vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"


                local client = vim.lsp.get_client_by_id(args.data.client_id)
                local opts = { buffer = 0, noremap = true, silent = true }

                if client == nil then
                    vim.print('LSP server is nil')
                    return
                end

                if client.supports_method('textDocument/rename') then
                    vim.keymap.set('n', 'grn' ,vim.lsp.buf.rename, opts)
                end

                if client.supports_method('textDocument/definition') then
                    vim.keymap.set('n', 'gd' ,vim.lsp.buf.definition, opts)
                end

                if client.supports_method('textDocument/references') then
                    vim.keymap.set('n', 'grr' ,vim.lsp.buf.references, opts)
                end

                if client.supports_method('textDocument/hover') then
                    vim.keymap.set('n', 'K' ,vim.lsp.buf.hover, opts)
                end

                if client.supports_method('textdocument/signature_help') then
                    vim.keymap.set('n', '<space>k' ,vim.lsp.buf.signature_help, opts)
                end

                -- if client.supports_method('textdocument/code_action') then
                    -- gca -- comment(gc) around(a)
                --     vim.keymap.set('n', '<space>gca' ,vim.lsp.buf.code_action, opts)
                -- end

                if client.supports_method('textdocument/document_symbol') then
                    vim.keymap.set('n', '<space>fs' ,vim.lsp.buf.document_symbol, opts)
                end

                if client.supports_method('textdocument/workspace_symbol') then
                    vim.keymap.set('n', '<space>fS' ,vim.lsp.buf.workspace_symbol, opts)
                end

                vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

               -- add all diagnostic to the quickfix list
                vim.keymap.set('n', '<space>dq', vim.diagnostic.setqflist, opts)
                -- *vim.diagnostic.setloclist()*


                -- Toggle off vim diagnostic by default
                vim.diagnostic.enable(false)

                local function diagnostics_toggle()
                    return vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                end

                vim.keymap.set('n', '<space>gt', function()
                        diagnostics_toggle()
                        print('[INFO] diagnostic ' .. (vim.diagnostic.is_enabled() and 'ON' or 'OFF'))
                    end,
                opts)

        end, })
    end,
}
