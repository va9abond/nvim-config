-- vim.opt_local.textwidth   = 70
-- vim.opt_local.colorcolumn = "71" -- 'textwidth' + 1
vim.opt_local.wrap        = false  -- Wrap long lines when it doesn't fit in window
vim.opt_local.linebreak   = false  -- Do not break long lines at 'breakat' (if 'wrap' is set)
vim.opt_local.breakindent = false  -- Indent wrapped lines to match line start
vim.opt_local.showbreak = string.rep(" → ", 3)


vim.opt_local.spelllang = 'en_us,ru_ru'
vim.opt_local.spell = true


-- vim.keymap.set('n', "<C-CR>", "<cmd>VimtexCompile<cr>", { noremap = true, silent = false, buffer = 0 })
