------------------------------------------------------------
-- Leader key
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'


------------------------------------------------------------
-- General
vim.opt.encoding = "utf-8"

vim.opt.timeoutlen   = 1000
vim.opt.updatetime   = 450

vim.opt.backup   = false  -- Don't store backup
vim.opt.hidden   = true
vim.opt.swapfile = false

vim.opt.scrolloff = 8  -- Hold X lines in the bottom when scrolling

vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.history = 100


------------------------------------------------------------
-- UI
vim.opt.wrap        = false -- Wrap long lines when it doesn't fit in window
-- vim.opt.textwidth   = 80
-- vim.opt.colorcolumn = "+1" -- 'textwidth' + 1
vim.opt.colorcolumn = "81"

vim.opt.cursorline = true  -- Switch highlighting of the current line

vim.opt.list = true
-- 'eol:¬, space:·, lead: , trail:·, nbsp:◇, tab:→-, extends:▸, precedes:◂, multispace:···⬝, leadmultispace:│   ,'
vim.opt.listchars:append { tab='→ ', leadmultispace='·', trail='·', --[[ eol = '↲' ]] }
vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes" -- Always show signcolumn
vim.o.laststatus   = 3     -- Global statusline (:h status-line)

vim.opt.inccommand = "split" -- split | nosplit (def)

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen" -- scroll behavior due actions with hor. split

vim.opt.termguicolors = true   -- Switch gui colors
vim.opt.background    = "dark" -- Set dark background


------------------------------------------------------------
-- Editor
vim.opt.expandtab   = true  -- Use spaces instead of tabs
vim.opt.tabstop     = 4     -- Insert N spaces for a tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4     -- Shift lines with '>/<' on N chars
vim.opt.cindent     = true  -- C style indenting :h C-indenting

vim.opt.hlsearch   = true  -- see :h 'hlsearch'
vim.opt.smartcase  = false -- see :h 'smartcase'
vim.opt.ignorecase = true  -- Ignore case when searching (use `\C` to force not doing that)
vim.opt.incsearch  = true  -- Show search results while typing
vim.opt.infercase  = true  -- see :h 'infercase'


------------------------------------------------------------
-- Spell
vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell"
vim.opt.spelllang     = "en,ru"
vim.opt.spelloptions  = "camel"

-- fuck changing keyboard layout (this does not word properly)
local langmap_keys = {
  'ёЁ;`~', '№;#',
  'йЙ;qQ', 'цЦ;wW', 'уУ;eE', 'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI', 'щЩ;oO', 'зЗ;pP', 'хХ;[{', 'ъЪ;]}',
  'фФ;aA', 'ыЫ;sS', 'вВ;dD', 'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK', 'дД;lL', [[жЖ;\;:]], [[эЭ;'\"]],
  'яЯ;zZ', 'чЧ;xX', 'сС;cC', 'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
}
vim.opt.langmap = table.concat(langmap_keys, ',')
