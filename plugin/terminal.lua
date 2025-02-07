-- ---------------------------------------------------------
local set = vim.opt_local
-- ---------------------------------------------------------
-- Set local settings for terminal buffers
vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", {}),
    callback = function()
        set.number = false
        set.relativenumber = false
        set.cursorline = false
        set.scrolloff = 0
    end,
})


-- ---------------------------------------------------------
vim.keymap.set('t', "<C-[>", "<C-\\><C-n>")

-- vim.keymap.set('t', "<C-h>", "<C-\\><C-N><C-w>h")
vim.keymap.set('t', "<C-j>", "<C-\\><C-N><C-w>j")
vim.keymap.set('t', "<C-k>", "<C-\\><C-N><C-w>k")
-- vim.keymap.set('t', "<C-l>", "<C-\\><C-N><C-w>l")

vim.keymap.set('t', "<C-c>", function()
    vim.cmd.nvim_buf_delete(0)
end)

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", "<leader>tt", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 10)
    vim.wo.winfixheight = true
    vim.cmd.term()
    vim.cmd.startinsert()
end)
