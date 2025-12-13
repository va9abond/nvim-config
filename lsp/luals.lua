-- See lua-language-server
-- [docs](https://luals.github.io/wiki/settings/)

return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },

    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },

            diagnostics = { globals = {
                    'vim', 'it', 'decribe', 'before_each', 'after_each'
                },
            },

            workspace = { library = { vim.env.VIMRUNTIME, } },
        }
    }
}
