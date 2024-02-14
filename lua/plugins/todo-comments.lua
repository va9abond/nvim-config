return {
    "folke/todo-comments.nvim", cond = true, lazy = true,
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufWritePost", "BufNewFile" }, -- "LazyFile"

    config = true,

    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
        { "<space>dt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
        -- { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
        -- { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
        -- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
}
