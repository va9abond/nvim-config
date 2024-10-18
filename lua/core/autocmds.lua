-- ---------------------------------------------------------
-- Highlight on yank
local HighlightYank_group =
    vim.api.nvim_create_augroup('HighlightYank', { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400, })
        end,
        group = HighlightYank_group,
        pattern = '*',
    }
)


-- ---------------------------------------------------------
-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = '',
    command = "set fo-=c fo-=r fo-=o"
})


-- ---------------------------------------------------------
