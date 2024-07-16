vim.opt_local.textwidth   = 70
vim.opt_local.colorcolumn = "+1" -- 'textwidth' + 1
vim.opt_local.wrap        = true  -- Wrap long lines when it doesn't fit in window
vim.opt_local.linebreak   = true  -- Break long lines at 'breakat' (if 'wrap' is set)
vim.opt_local.breakindent = true  -- Indent wrapped lines to match line start
vim.opt_local.showbreak = string.rep(" ", 3)

-- vim.opt.formatoptions = 'rqnl1jt'
vim.opt_local.formatoptions:append('t')

vim.opt_local.listchars:remove { eol = '↲' }
-- ---------------------------------------------------------
                                              -- Spell check
vim.opt_local.spelllang = 'en_us,ru_ru'
vim.opt_local.spell = true


-- vim.keymap.set('n', "<C-CR>", "<cmd>!python3 %<cr>", { noremap = true, silent = false, buffer = 0 })
