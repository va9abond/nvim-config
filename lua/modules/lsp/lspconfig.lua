vim.lsp.enable('luals');
vim.lsp.enable('clangd')
vim.lsp.enable('texlab')
vim.lsp.enable('pyright')
vim.lsp.enable('marksman')

-- Off diagnostics by default
vim.diagnostic.enable(false)

-- ?? Is it works?
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities()
})


vim.api.nvim_create_autocmd('LspAttach', {
    -- :h lsp-defaults
    -- :h diagnostic-defaults
    -- :h lsp-attach

    group = vim.api.nvim_create_augroup('lsp-attach-custom', {}),
    callback = function(args)

        local bufnr = args.buf
        vim.bo[bufnr].formatexpr = nil
        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
        vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
        -- vim.keymap.del('n', 'K', { buffer = bufnr })

        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        local opts = { buffer = bufnr, noremap = true, silent = true }

        if client == nil then
            vim.print("pupupu, something went wrong with LSP")
            return
        end

        -- Disable semantic highlights
        client.server_capabilities.semanticTokensProvider = nil

        -- lsp-defaults
        -- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
        -- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
        -- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
        -- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
        -- "grt" is mapped in Normal mode to |vim.lsp.buf.type_definition()|
        -- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
        -- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|

        -- ??
        -- vim.keymap.del('n', 'gra', { buffer = bufnr })
        -- vim.keymap.del({'i', 's'}, '<C-S>', { buffer = bufnr })


        -- lsp-methon
        -- 'textDocument/codeLens'
        -- 'textDocument/completion'
        -- 'textDocument/diagnostic'
        -- 'textDocument/documentHighlight'
        -- 'textDocument/documentSymbol'
        -- 'textDocument/formatting'
        -- 'textDocument/hover'
        -- 'textDocument/inlayHint'
        -- 'textDocument/publishDiagnostics'
        -- 'textDocument/rangeFormatting'
        -- 'textDocument/rename'
        -- 'textDocument/signatureHelp'

        -- if client:supports_method('textDocument/hover') then
        --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        -- end


        local function diagnostics_toggle()
            return vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end

        -- send all diagnostics in quickfix list *vim.diagnostic.setloclist()*
        vim.keymap.set('n', '<space>dq', vim.diagnostic.setqflist, opts)

        vim.keymap.set('n', '<space>dt', function()
            diagnostics_toggle()
            print('[INFO] diagnostics ' .. (vim.diagnostic.is_enabled() and 'ON' or 'OFF'))
        end, opts)

    end
})


return {
    'neovim/nvim-lspconfig',
    cond = true, lazy = false,

    dependencies = {
        'williamboman/mason.nvim',
        'saghen/blink.cmp',

        { 'folke/lazydev.nvim', ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },

    },
}
-- function()
--         -- local lspconfig = require('lspconfig')
--         local blink_capabilities = require('blink.cmp').get_lsp_capabilities()
--
--         vim.lsp.config('*', {
--             capabilities = blink_capabilities,
--             -- root_markers = { '.git' },
--         })
--
--         vim.api.nvim_create_autocmd('LspAttach', {
--             group = vim.api.nvim_create_augroup('lsp-attach-custom', {}),
--             callback = function(args)
--                 local bufnr = args.buf
--
--                 vim.bo[bufnr].formatexpr = nil
--                 vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
--                 vim.bo[bufnr].tagfunc = 'v:lua.vim.lsp.tagfunc'
--
--
--                 local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--                 local opts = { buffer = bufnr, noremap = true, silent = true }
--
--                 if client == nil then
--                     vim.print('LSP server is nil')
--                     return
--                 end
--
--                 -- local disabled_methods = ""
--                 --
--                 -- if not client:supports_method('textDocument/rename') then
--                 --     disabled_methods = disabled_methods .. 'rename,'
--                 -- end
--                 --
--                 -- if not client:supports_method('textDocument/code_action') then
--                 --     disabled_methods = disabled_methods .. 'code action,'
--                 -- end
--                 --
--                 -- if not client:supports_method('textDocument/references') then
--                 --     disabled_methods = disabled_methods .. 'references,'
--                 -- end
--                 --
--                 -- if not client:supports_method('textDocument/implementation') then
--                 --     disabled_methods = disabled_methods .. 'implementation,'
--                 -- end
--                 --
--                 -- if not client:supports_method('textDocument/type_definition') then
--                 --     disabled_methods = disabled_methods .. 'type definition,'
--                 -- end
--                 --
--                 -- if not client:supports_method('textDocument/document_symbol') then
--                 --     disabled_methods = disabled_methods .. 'document symbol,'
--                 -- end
--                 --
--                 -- if not client:supports_method('textDocument/workspace_symbol') then
--                 --     disabled_methods = disabled_methods .. 'workspace symbol'
--                 -- end
--                 -- print('[LSP] unable client methods:', disabled_methods)
--
--
--                 -- if client:supports_method('textDocument/definition') then
--                 --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--                 -- end
--
--                 -- if client:supports_method('textDocument/hover') then
--                 --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--                 -- end
--
--                 -- if client:supports_method('textDocument/signature_help') then
--                 --     -- vim.keymap.set('n', '<space>k', vim.lsp.buf.signature_help, opts)
--                     -- vim.keymap.del('n', '<C-s>', { buffer = args.buf })
--                 -- end
--
--                 --  'signature_help'
--                 -- 'textDocument/codeLens'
--                 -- 'textDocument/completion'
--                 -- 'textDocument/diagnostic'
--                 -- 'textDocument/documentHighlight'
--                 -- 'textDocument/documentSymbol'
--                 -- 'textDocument/formatting'
--                 -- 'textDocument/hover'
--                 -- 'textDocument/inlayHint'
--                 -- 'textDocument/inlineCompletion'
--                 -- 'textDocument/publishDiagnostics'
--                 -- 'textDocument/rangeFormatting'
--                 -- 'textDocument/rename'
--                 -- 'textDocument/signatureHelp'
--
--                 --  ]d jumps to the next diagnostic in the buffer. ]d-default
--                 -- [d jumps to the previous diagnostic in the buffer. [d-default
--                 -- ]D jumps to the last diagnostic in the buffer. ]D-default
--                 -- [D jumps to the first diagnostic in the buffer. [D-default
--                 -- <C-w>d shows diagnostic at cursor in a floating window. CTRL-W_d-default
--                 -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--                 -- vim.keymap.set('n', '[d', function()
--                 --     vim.diagnostic.jump({count=-1, float=true})
--                 -- end, opts)
--                 -- vim.keymap.set('n', ']d', function()
--                 --     vim.diagnostic.jump({count=1, float=true})
--                 -- end, opts)
--
--
--
--                 -- Off diagnostics by default
--                 vim.diagnostic.enable(false)
--
--                 local function diagnostics_toggle()
--                     return vim.diagnostic.enable(not vim.diagnostic.is_enabled())
--                 end
--
--                 vim.keymap.set('n', '<space>dt', function()
--                         diagnostics_toggle()
--                         print('[INFO] diagnostics ' .. (vim.diagnostic.is_enabled() and 'ON' or 'OFF'))
--                     end,
--                 opts)
--
--         end, })
--     end,
--
-- }
