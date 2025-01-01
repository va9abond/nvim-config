vim.keymap.set('n', "<C-CR>", "<cmd>!julia %<cr>", { noremap = true, silent = false, buffer = 0 })
vim.keymap.set('n', "<F5>", "<cmd>!julia % > output<cr>", { noremap = true, silent = false, buffer = 0 })
