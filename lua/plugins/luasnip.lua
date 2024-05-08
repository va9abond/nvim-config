return {
    "L3MON4D3/LuaSnip", cond = false, lazy = true,
    version = "v2.*",

    dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },

    opts = {
        history = true,
        delete_check_events = "TextChanged",
    },

    keys = {
        { "<C-l>", function() require("luasnip").jump(1) end, mode = {'s','i'} },
        { "<C-h>", function() require("luasnip").jump(-1) end, mode = {'i','s'} },
    },
}
