-- ---------------------------------------------------------
local function map(m,k,v)
    vim.keymap.set(m,k,v, {noremap = true, silent = false})
end
-- ---------------------------------------------------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- ---------------------------------------------------------
                                        -- Insert mode binds
map('i', 'jk', '<esc>')
map('i', '<C-d>', '<del>')
map('i', '<C-h>', '<Left>')
map('i', '<C-l>', '<Right>')
map('i', '<C-j>', '<S-Left>')
map('i', '<C-k>', '<S-Right>')


-- ---------------------------------------------------------
                                  -- Command-line mode binds
map({'t','c'}, '<C-h>', '<Left>')
map({'t','c'}, '<C-l>', '<Right>')
map({'t','c'}, '<C-j>', '<S-Left>')
map({'t','c'}, '<C-k>', '<S-Right>')
map({'t','c'}, '<C-d>', '<del>')


-- ---------------------------------------------------------
                                               -- Fast quite
map('n', '<leader>x', '<cmd>bd<cr>')
map('n', '<leader>q', '<cmd>q<cr>')
map('n', '<leader>Q', '<cmd>q!<cr>')


-- ---------------------------------------------------------
                           -- Inserts blank line below/above
map('n', '<CR>', 'o<ESC>')
map('n', '<S-Enter>', 'O<ESC>')


-- ---------------------------------------------------------
                                             -- Split window
map('n', '<C-w>v', '<CMD>vsplit<CR>')
map('n', '<C-w>x', '<CMD>split<CR>')


-- ---------------------------------------------------------
                                            -- Zooming panes
map('n', '<C-w>z', '<C-w>|')


-- ---------------------------------------------------------
                                          -- Should not used
-- map('n', '<C-w>z', '<C-w>|')


-- ---------------------------------------------------------
                                             -- Panes resize
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -5<cr>')
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +5<cr>')
vim.keymap.set('n', '<C-Up>', '<cmd>res -5<cr>')
vim.keymap.set('n', '<C-Down>', '<cmd>res +5<cr>')


-- ---------------------------------------------------------
                                         -- Panes navigation
map({ 'n', 'i' }, '<C-h>', '<C-w><C-h>')
map({ 'n', 'i' }, '<C-j>', '<C-w><C-j>')
map({ 'n', 'i' }, '<C-k>', '<C-w><C-k>')
map({ 'n', 'i' }, '<C-l>', '<C-w><C-l>')


-- ---------------------------------------------------------
-- Use operator pending mode to visually select the whole
-- buffer e.g. dA = delete buffer ALL,
--             yA = copy whole buffer
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')


-- ---------------------------------------------------------
map({'v', 'n'}, '<leader>y', [["+y]])
map('n',        '<leader>Y', [["+Y]])
map({'n', 'v'}, '<leader>d', [["+d]])
map('n',        '<leader>D', [["+D]])
map({'n', 'v'}, '<leader>p', [["+p]])
map('n',        '<leader>P', [["+P]])


-- ---------------------------------------------------------
                       -- Where do black hole register lead?
map('n', 'x', '"_x')
-- ---------------------------------------------------------
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- ---------------------------------------------------------
                             -- Fix * (Keep cursor position,
                                -- don't move to next match)
map('n', '*', '*N')
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')


-- ---------------------------------------------------------
                          -- Halp page scroll with centering
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')


-- ---------------------------------------------------------
                                            -- Text aligning
map('n', '<leader>>', '<cmd>.right 60<cr>')
map('n', '<leader><', '<cmd>.left 0<cr>')


-- ---------------------------------------------------------
                                                    -- Netrw
vim.keymap.set('n', "<leader><leader>", vim.cmd.Lexplore)
-- vim.keymap.set('n', '-', vim.cmd.Sexplore)


                                 -- other binds in binds.vim
-- ---------------------------------------------------------
                                   -- Move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")


-- ---------------------------------------------------------
-- Do not include white space characters when using $ in visual mode;
           -- see https://vi.stackexchange.com/q/12607/15292
                        -- Go to start or end of line easier
vim.keymap.set({ "n", "x" }, "H", "^")
vim.keymap.set({ "n", "x" }, "L", "g_")


-- ---------------------------------------------------------
  -- Continuous visual shifting (does not exit Visual mode),
             -- `gv` means to reselect previous visual area;
                -- see https://superuser.com/q/310417/736190
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")


-- ---------------------------------------------------------
             -- Reselect the text that has just been pasted;
         -- see https://stackoverflow.com/a/4317090/6064933
vim.keymap.set("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {
  expr = true,
  desc = "reselect last pasted area",
})


-- ---------------------------------------------------------
    -- Change text without putting it into the vim register;
            -- see https://stackoverflow.com/q/54255/6064933
vim.keymap.set("n", "c", '"_c')
vim.keymap.set("n", "C", '"_C')
vim.keymap.set("n", "cc", '"_cc')
vim.keymap.set("x", "c", '"_c')


-- ---------------------------------------------------------
          -- Replace visual selection with text in register,
                           -- but not clogging the register;
    -- see also https://stackoverflow.com/q/10723700/6064933
vim.keymap.set("x", "p", '"_c<Esc>p')


-- ---------------------------------------------------------
-- Reference:
            -- echasnovski
            -- ThePrimeagen,
            -- jdhao,
            -- Tj DeVries
            -- asbjornHaland,
            -- sdaschner

