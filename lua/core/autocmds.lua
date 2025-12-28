-- Highlight on yank
local grp_highlight_yank =
    vim.api.nvim_create_augroup('HighlightYank', { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
            vim.highlight.on_yank({ higroup = "IncSearch", timeout = 400, })
        end,
        group = grp_highlight_yank,
        pattern = '*',
    }
)


-- Don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = '',
    command = "set fo-=c fo-=r fo-=o"
})


-- Return to last edit position when opening file
vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})


-- Create directories when saving files
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     group = augroup,
--     callback = function()
--         local dir = vim.fn.expand('<afile>:p:h')
--         if vim.fn.isdirectory(dir) == 0 then
--             vim.fn.mkdir(dir, 'p')
--         end
--     end,
-- })


vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "/home/rustem/local/msvc-stl/inc/*",
    command = "set filetype=cpp"
})
