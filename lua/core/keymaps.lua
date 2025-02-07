-- ---------------------------------------------------------
local function map(m,k,v)
    vim.keymap.set(m,k,v, {noremap = true, silent = false})
end
-- ---------------------------------------------------------
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'
-- ---------------------------------------------------------
-- Other
map('n', "<C-\\>", "<C-l>")
-- map('n', "<C-f>", "<Nop>")
map({'n', 'v'}, "<Space>", "<Nop>")
map('n', "<C-LeftMouse>", "<Nop>")

-- ---------------------------------------------------------
-- Insert map-mode
map('i', "jk", "<esc>")
map('i', "<C-g>", "<del>")
map('i', "<C-h>", "<BS>")
map('i', "<C-a>", "<Nop>")
map('i', "<BS>", "<Nop>")
map('i', "<C-Space>", "<Nop>")
map('i', "<LeftMouse>", "<Nop>")
map('i', "<RightMouse>", "<Nop>")
map('i', "<C-RightMouse>", "<Nop>")
map('i', "<C-LeftMouse>", "<Nop>")


-- ---------------------------------------------------------
-- Command-line map-mode
map('c', "<C-b>", "<Left>")
map('c', "<C-f>", "<Right>")
-- map('c', "<C-j>", "<S-Left>")
-- map('c', "<C-k>", "<S-Right>")
map('c', "<C-g>", "<del>")


-- ---------------------------------------------------------
-- Buffers
map('n', "[b", "<cmd>bprev<cr>")
map('n', "]b", "<cmd>bnext<cr>")
map('n', "<leader>bl", "<cmd>ls<cr>") -- buffer list

-- enable mini-bufremove
-- map('n', "<leader>bd", "<cmd>bd!<cr>") -- check mini-bufremove (to save layout)
-- map('n', "<leader>x", "<cmd>bd<cr>") -- buffer delete + close window


-- ---------------------------------------------------------
-- Windows (:h window)
map('n', "<C-w>v", "<CMD>vsplit<CR>")
map('n', "<C-w>z", "<C-w>|<C-w>_")

map('n', "<C-h>", "<C-w><C-h>")
map('n', "<C-j>", "<C-w><C-j>")
map('n', "<C-k>", "<C-w><C-k>")
map('n', "<C-l>", "<C-w><C-l>")

-- <C-w>n - create new window with empty file as (:new)
-- <C-w>q - similar to :q
-- <C-w>o - make the current window the only one on the screen. All other
--          windows are closed
-- <C-w>w - next-layout window
-- <C-w>W - prev-layout window
-- <C-w>t - top-left window
-- <C-w>b - bottom-right window
-- <C-w>p - last accessed window
-- <C-w>P - go to preview window

map('n', "<C-Left>", "<cmd>vertical resize -5<cr>")
map('n', "<C-Right>", "<cmd>vertical resize +5<cr>")
map('n', "<C-Up>", "<cmd>resize -5<cr>")
map('n', "<C-Down>", "<cmd>resize +5<cr>")


-- ---------------------------------------------------------
-- Inserts blank line below/above
map('n', "<CR>", "o<ESC>")
map('n', "<S-CR>", "O<ESC>")


-- ---------------------------------------------------------
-- Use operator pending mode to visually select the whole buffer
-- dA = delete buffer ALL,
-- yA = yank buffer ALL.
map('o', 'A', ":<C-U>normal! mzggVG<CR>`z")
map('x', 'A', ":<C-U>normal! ggVG<CR>")


-- ---------------------------------------------------------
-- Yank, cut, paste (system clipboard)
map({'n', 'v'}, "<leader>y", [["+y]])
map({'n', 'v'}, "<leader>p", [["+p]])
map({'n', 'v'}, "<leader>d", [["+x]]) -- cut (yank in register and delete)

map('n', "<leader>Y", [["+Y]])
map('n', "<leader>P", [["+P]])

map({'n', 'v'}, 'x', [["_x]])


-- ---------------------------------------------------------
-- Change text without putting it into the vim register
-- see https://stackoverflow.com/q/54255/6064933
map({'n', 'v'}, 'c', [["_c]])
map({'n', 'v'}, 'C', [["_C]])


-- ---------------------------------------------------------
-- Replace visual selection with text in register,
-- but not clean the register after
-- see https://stackoverflow.com/q/10723700/6064933
map('x', 'p', [["_c<Esc>p]])


-- ---------------------------------------------------------
vim.keymap.set({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- ---------------------------------------------------------
-- Fix * (keep cursor position, don't move to next match)
map('n', '*', "*N")
map('n', 'n', "nzzzv")
map('n', 'N', "Nzzzv")


-- ---------------------------------------------------------
-- Page scrolling with centering
map('n', "<C-d>", "<C-d>zz")
map('n', "<C-u>", "<C-u>zz")


-- ---------------------------------------------------------
-- Moves lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")


-- ---------------------------------------------------------
-- Text aligning
map('n', "<leader>>", "<cmd>.right textwidth<cr>")
map('n', "<leader><", "<cmd>.left 0<cr>")


-- ---------------------------------------------------------
-- Go to start/end of line easier
-- see https://vi.stackexchange.com/q/12607/15292
map({'n', 'v', 'o'}, 'H', '^')
map({'n', 'v', 'o'}, 'L', 'g_')


-- ---------------------------------------------------------
-- Continuous visual shifting (does not exit Visual mode),
-- `gv` means to reselect previous visual area
-- see https://superuser.com/q/310417/736190
map('x', '<', '<gv')

map('x', '>', '>gv')


-- ---------------------------------------------------------
-- Reselect the text that has just been pasted
-- see https://stackoverflow.com/a/4317090/6064933
vim.keymap.set(
    'n', "<leader>v", "printf('`[%s`]', getregtype()[0])",
    { expr = true, desc = "Reselect last pasted area" }
)


-- ---------------------------------------------------------
-- Refs:
    -- echasnovski
    -- ThePrimeagen
    -- jdhao
    -- Tj DeVries
    -- asbjornHaland
    -- sdaschner
