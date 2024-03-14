return {
    "folke/trouble.nvim", cond = true, lazy = true,
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        action_keys = { -- key mappings for actions in the trouble list
            refresh = "gr", -- manually refresh
            switch_severity = "gs", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
            preview = "<C-p>", -- preview the diagnostic location
            help = "g?" -- help menu
        },
    },

    keys = {
        { "<space>dd", function() require("trouble").toggle() end, mode = "n" },
        { "<space>dw", function() require("trouble").toggle("workspace_diagnostics") end, mode = "n" },
        { "<space>dq", function() require("trouble").toggle("quickfix") end, mode = "n" },
        { "<space>dl", function() require("trouble").toggle("loclist") end, mode = "n" },
        -- { "gr", function() require("trouble").toggle("lsp_references") end, mode = "n" },
        {
            "[q", -- prev quickfix item
            function()
                if require("trouble").is_open() then
                    require("trouble").previous({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous trouble/quickfix item",
        },
        {
            "]q", -- next quickfix item
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Next trouble/quickfix item",
        },
    },
}
