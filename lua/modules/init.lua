return {
    { "lyokha/vim-xkbswitch", enabled = true, },

    {
        "m4xshen/autoclose.nvim", enabled = true,
        config = function()
            require("autoclose").setup({
                keys = {
                    ["$"] = { escape = true, close = true, pair = "$$", disabled_filetypes = {} },
                    ["<"] = { escape = true, close = true, pair = "<>" },
                },
                options = {
                    disabled_filetypes = { "text", "markdown" },
                    disable_command_mode = true,
                }
            })
        end
    },
}
