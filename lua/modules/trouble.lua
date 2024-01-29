return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n", "<space>x", function() require("trouble").toggle() end)
        vim.keymap.set("n", "<space>q", function() require("trouble").toggle("quickfix") end)
        vim.keymap.set("n", "<space>l", function() require("trouble").toggle("loclist") end)
    end,
}
