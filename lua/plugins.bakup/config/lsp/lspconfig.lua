------------------------------------------------------------
                                  -- vim.diagnostic.config()
vim.diagnostic.config({
    underline = true,
    update_in_insert = false,
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = '●', -- Could be '■', '▎', 'x'
    },

    severty_sort = true,

    inlay_hints = { enabled = false },

    format = {
        formatting_options = nil,
        timeout_ms = nil,
    },
})


------------------------------------------------------------
                                               -- LSP config
local lspconfig = require("lspconfig")

-- local default_capabilities = require("cmp_nvim_lsp").default_capabilities()
local default_capabilities = vim.lsp.protocol.make_client_capabilities()


local custom_on_attach = function(_, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Attach mappings to buffer
    local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<space><C-k>', vim.lsp.buf.signature_help, opts)

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)

    vim.keymap.set({'n','v'}, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)

    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end


--    opts.desc = "Show buffer diagnostics"
--    vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

--    opts.desc = "Show line diagnostics"
--    vim.keymap.set("n", "<space>d", function() require("trouble").toggle("document_diagnostics") end)


------------------------------------------------------------
                                            -- Servers setup
local servers = { "pyright", "julials", "marksman", "cmake" }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup({
        capabilities = default_capabilities,
        on_attach = custom_on_attach
    })
end


------------------------------------------------------------
                                                   -- lua_ls
lspconfig["lua_ls"].setup({
    capabilities = default_capabilities,
    on_attach = custom_on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT'
            },
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = {
                library = {
                    vim.env.VIMRUNTIME,
                }
            }
        }
    }
})


------------------------------------------------------------
                                                   -- clangd
lspconfig['clangd'].setup({
    on_attach = custom_on_attach,

    keys = {
        { "<space>gs", "<cmd>ClangdSwitchSourceHeader<cr>",
          desc = "Switch Source/Header (C/C++)" },
    },

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

    capabilities = {
        offsetEncoding = { "utf-16" },
    },

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


------------------------------------------------------------
                                                   -- texlab
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


------------------------------------------------------------
                                                   -- bashls
lspconfig['bashls'].setup({
    capabilities = default_capabilities,
    on_attach = custom_on_attach,
})
