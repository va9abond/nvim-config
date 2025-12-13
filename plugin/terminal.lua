-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.cursorline = false
        vim.opt_local.scrolloff = 0
    end,
})


-- ---------------------------------------------------------
vim.keymap.set('t', "<C-[>", "<C-\\><C-n>")
vim.keymap.set('t', "<C-c>", "<C-\\><C-n>")
vim.keymap.set('t', "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set('t', "<C-k>", "<C-\\><C-N><C-w>k")

-- vim.keymap.set('t', "<C-c>", function()
--     vim.cmd.nvim_buf_delete(0)
-- end)

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set('n', "<leader>tt", function()
    vim.cmd.new() -- opent new window for terminal
    vim.cmd.wincmd('J') -- move this new window to most bottom and take all width
    vim.api.nvim_win_set_height(0, 10)
    vim.wo.winfixheight = true
    vim.cmd.term()
    vim.cmd.startinsert()
end)
