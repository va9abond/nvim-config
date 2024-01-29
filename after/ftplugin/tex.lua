-- ---------------------------------------------------------
                                                    -- Binds
vim.keymap.set({'i', 'n'}, '<C-Enter>', '<cmd>VimtexCompile<cr>')
vim.keymap.set('n', '<C-c>', '<cmd>VimtexClean<cr>')
vim.keymap.set('n', '<Bslash>t', '<cmd>VimtexTocToggle<cr>')
-- ---------------------------------------------------------
                                              -- Spell check
vim.opt.spelllang = 'en_us,ru_ru'
vim.opt.spell = true
