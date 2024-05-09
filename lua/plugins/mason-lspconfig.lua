return {
    "williamboman/mason-lspconfig.nvim", cond = true, lazy = true,
    opts = {
        automatic_installation = true,
        ensure_installed = {
            "clangd", -- tag example: "clangd@16.0.2",
            "cmake",
            "lua_ls",
            "julials",
            "texlab",
            "pyright",
        },
    },
}
