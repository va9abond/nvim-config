return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",

        opts = {
            ensure_installed = {
--                "stylua",
 --               "shfmt",
                -- "flake8",
            },
        },

        config = function(_, opts)
            require("mason").setup(opts)
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    'clangd', -- 'clangd@16.0.2',
                    'cmake',
                    'lua_ls',
                    'julials',
                    'texlab',
                },
            },
    }
}
