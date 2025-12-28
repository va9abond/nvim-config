local function map (mode, lhs, rhs, opts)
    local defaults = {
        noremap = true,
        silent = false,
        desc = ""
    }

    local opts = vim.tbl_extend("force", defaults, opts or {})

    vim.keymap.set(mode, lhs, rhs, opts)
end



vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


map('n', '<C-LeftMouse>', '<Nop>')
map('n', '<C-\\>', '<C-l>')
map('n', '<leader>x', '<cmd>q<cr>')

map('i', '<C-Space>', '<Nop>')
map('i', '<C-g>', '<del>')
map('i', '<C-h>', '<BS>')
map('i', '<BS>',  '<Nop>')

map({'i', 't'}, '<C-п>', '<del>')
map({'i', 't'}, '<C-р>', '<BS>')
map({'i', 't'}, '<C-ц>', '<C-w>')
map({'i', 't'}, '<C-ь>', '<CR>')
map({'i', 't'}, '<C-х>', '<Esc>')
map({'i', 't'}, '<C-ш>', '<Tab>')
map({'i', 't'}, '<C-в>', '<C-d>')
map({'i', 't'}, '<C-е>', '<C-t>')


-- Fuck mouse in insert mode
map('i', '<LeftMouse>',    '<Nop>')
map('i', '<RightMouse>',   '<Nop>')
map('i', '<C-RightMouse>', '<Nop>')
map('i', '<C-LeftMouse>',  '<Nop>')


-- Command-line map-mode
map('c', '<C-b>', '<Left>')
map('c', '<C-f>', '<Right>')
-- map('c', '<C-j>', '<S-Left>')
-- map('c', '<C-k>', '<S-Right>')
map('c', '<C-g>', '<del>')


-- Buffers
map('n', '[b', '<cmd>bprev<cr>')
map('n', ']b', '<cmd>bnext<cr>')
-- map('n', '<leader>h', '<cmd>bprev<cr>')
-- map('n', '<leader>l', '<cmd>bnext<cr>')
-- map('n', '<leader>c', '<cmd>bd<cr>') -- mini-bufremove
map('n', '<leader>C', '<cmd>bd!<cr>') -- unload buffer (force)


-- QuickFix
map('n', '[q', '<cmd>cprev<cr>')
map('n', ']q', '<cmd>cnext<cr>')
map('n', '<leader>q', '<cmd>copen<cr><cmd>resize 6<cr>')


-- <C-w>
map('n', '<C-w>v', '<CMD>vsplit<CR>')
map('n', '<C-w>z', '<C-w>|<C-w>_')
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')
map('n', '<C-l>', '<C-w><C-l>')

map('n', '<C-w>n', '<cmd>8new<cr>')

-- <C-w>n - create new window with empty file as :new
-- <C-w>q - similar to :q
-- <C-w>o - make the current window the only one on the screen. All other
--          windows are closed
-- <C-w>w - next-layout window
-- <C-w>W - prev-layout window
-- <C-w>t - top-left window
-- <C-w>b - bottom-right window
-- <C-w>p - last accessed window
-- <C-w>P - go to preview window
-- <C-w>r - rotate window downwards/rightwards
-- <C-w>R - rotate window upwards/leftwards
-- <C-w>x - (mini-bufremove) exchange current window with the next one
-- <C-w>K - make current window most top
-- <C-w>J - make current window most bottom
-- <C-w>L - make current window most right
-- <C-w>H - make current window most left
-- <C-w>i - Open a new window, with the cursor on the first line
--          that contains the keyword under the cursor.

map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Tabs
-- map('n', '<C-w>t', '<C-w>T') -- move current window in new tab (:tab split) -- use <C-w>T
-- <C-w>gf - Open a new tab page and edit the file name under the cursor


-- Tags
-- :tag {name} - jump to the definition of name, using tag files
-- ^] - jump to the definition of the keyword under the cursor
--      = :tag {name} where {name} keyword under the cursor
-- :tselect - list the tags that match {name}
-- :tjump = :tselect but if only one item in the list jump on it
-- g] - :tselect {name}
-- g^] - :tjump {name}
-- <C-w> - :tag {name} in a split
-- <C-w>g] - :tselect {name} in a split
-- <C-w>} - :ptag {name} in a split
-- <C-w>g} - :ptjump {name} in a split


map('n', "<CR>", "o<ESC>", { desc = "Insert blank line below" })
map('n',"[<CR>", "O<ESC>", { desc = "Insert blank line above" })


-- Center screen when jumping
-- map('n', '*', "*N")
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })


map({'n', 'v'}, 'c', '"_c', { desc = "Change without yanking" })
map({'n', 'v'}, 'C', '"_C', { desc = "Change without yanking" })

map({'n', 'v'}, "<leader>Y", [["+y$]])
map({'n', 'v'}, "<leader>y", [["+y]])

map({'n', 'v'}, "<leader>P", [["+P]])
map({'n', 'v'}, "<leader>p", [["+p]])

map({'n', 'v', 'x'}, 'x', [["_x]])
map('x', 'p', [["_c<Esc>p]], { desc = "Replace visual selection with text in register" })


map('o', 'A', ":<C-U>normal! mzggVG<CR>`z")
map('x', 'A', ":<C-U>normal! ggVG<CR>")


map({'n', 'v'}, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({'n', 'v'}, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


map('x', '<', '<gv', { desc = "Indent left and reselect" })
map('x', '>', '>gv', { desc = "Indent right and reselect" })

map('v', 'J', ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

map('v', "<leader>>", "<cmd>.right textwidth<cr>")
map('v', "<leader><", "<cmd>.left 0<cr>")


map({'n', 'v', 'o'}, '<S-h>', '^', { desc = "Go to the begin of the line" })
map({'n', 'v', 'o'}, '<S-l>', '$', { desc = "Go to the end of the line" })
-- map({'n', 'v', 'o'}, '<S-l>', 'g_')

map(
    'n', "<leader>v", "printf('`[%s`]', getregtype()[0])",
    { expr = true, desc = "Reselect last pasted area" }
)

-- map('o', '<leader>v', '<Cmd>normal! `[v`]<CR>', {
--     desc = 'Select previously changed/yanked text',
-- })

-- vim.keymap.set('n', "<C-x>e", ":Explore<CR>", { desc = "Open file explorer" })
vim.keymap.set('n',  "<C-x><C-f>", ":find ", { desc = "Find file" })
