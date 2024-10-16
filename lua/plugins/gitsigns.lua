return {
    "lewis6991/gitsigns.nvim", cond = true, lazy = true,
    event = { "BufReadPost", "BufWritePost", "BufNewFile" }, -- "LazyFile"

    opts = {
        signs = {
            add          = { text = '│' },
            change       = { text = '│' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
        },

        -- TODO: make keymaps throught lazy keys

        -- on_attach = function(buffer)
        --     local gs = package.loaded.gitsigns
        --
        --     local function map(mode, l, r, desc)
        --         vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        --     end
        --
        --     map("n", "]h", gs.next_hunk, "Next Hunk")
        --     map("n", "[h", gs.prev_hunk, "Prev Hunk")
        --     map({"n","v"}, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        --     map({"n","v"}, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        --     map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
        --     map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
        --     map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
        --     map("n", "<leader>ghd", gs.diffthis, "Diff This")
        --     map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
        --     map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
        -- end,
    },
}
