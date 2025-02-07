return {
    "zaldih/themery.nvim", lazy = false,

    config = function()
        require("themery").setup({
            themes = { "mycolors", "habamax" },
            livePreview = false,
        })
    end,

    keys = {
        { "<space>x",
        function()
            local themery = require("themery")
            themery.getAvailableThemes()
        end, }
    }
}
