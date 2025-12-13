local opts = { noremap = true, silent = false, buffer = 0 }

vim.keymap.set('n', '<CR>', '<CR>', opts)
vim.keymap.set('n', '<C-p>', '<cmd>cprev<cr>', opts)
vim.keymap.set('n', '<C-n>', '<cmd>cnext<cr>', opts)
vim.keymap.set('n', 'P', '<cmd>cfirst<cr>', opts)
vim.keymap.set('n', 'N', '<cmd>clast<cr>', opts)
vim.keymap.set('n', '[Q', '<cmd>cold<cr>', opts)
vim.keymap.set('n', ']Q', '<cmd>cnewer<cr>', opts)

vim.opt_local.number = true
vim.opt_local.relativenumber = false
