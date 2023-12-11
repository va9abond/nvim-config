return {
    "williamboman/mason.nvim",
    config = true,
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    'clangd', -- 'clangd@16.0.2',
                    'cmake',
                    'lua_ls',
                    'julials',
                    'texlab',
                    "stylua",
                    "shfmt",
                },
            },
        },
    }
}
