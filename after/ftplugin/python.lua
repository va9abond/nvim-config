vim.keymap.set('n', "<C-CR>", "<cmd>!python3 %<cr>", { noremap = true, silent = false })
vim.keymap.set('n', "<F5>", "<cmd>!python3 % > output<cr>", { noremap = true, silent = false })
-- vim.keymap.set('n', "<C-CR>", "<cmd>!command time python3 %<cr>", { noremap = true, silent = false })
-- vim.keymap.set('n', "<F5>", "<cmd>!command time python3 % > output<cr>", { noremap = true, silent = false })
