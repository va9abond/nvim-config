------------------------------------------------------------
                                               -- Leader Key
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'
vim.opt.timeoutlen   = 1000
vim.opt.updatetime   = 450
------------------------------------------------------------
                                                  -- General
vim.opt.encoding = "utf-8"

vim.opt.backup      = false    -- Don't store backup
vim.opt.hidden      = true
vim.opt.swapfile    = false

vim.opt.scrolloff = 8   -- Hold X lines in the bottom when scrolling

vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.history = 100


------------------------------------------------------------
                                                       -- UI
vim.opt.wrap        = false -- Wrap long lines when it doesn't fit in window
-- vim.opt.textwidth   = 80
-- vim.opt.colorcolumn = "+1" -- 'textwidth' + 1
vim.opt.colorcolumn = "81" -- 'textwidth' + 1
vim.opt.cursorline = true  -- Switch highlighting of the current line
vim.opt.list = true
vim.opt.listchars:append { tab='→ ', leadmultispace='·', trail='·', --[[ eol = '↲' ]] }
-- vim.opt.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
vim.opt.number         = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes" -- Always show signcolumn
-- vim.o.laststatus = 2       -- Always show statusline (:h status-line)
vim.o.laststatus = 3       -- Global statusline (:h status-line)

vim.opt.termguicolors = true   -- Switch gui colors
vim.opt.background    = "dark" -- Set dark background

vim.opt.inccommand = "split" -- new 0.10 neovim feature

vim.opt.splitbelow = true
vim.opt.splitright = true

-- cursor (def) | screen (stabilize text) | topline (stabilize topline)
vim.opt.splitkeep = "screen"


------------------------------------------------------------
                                                   -- Editor
vim.opt.expandtab   = true  -- Use spaces instead of tabs
vim.opt.tabstop     = 4     -- Insert X spaces for a tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4     -- Shift lines with '>/<' on X chars
-- vim.opt.autoindent  = true  -- Use auto indent
-- vim.opt.smartindent = true  -- Make indenting smart
vim.opt.cindent     = true  -- C style indenting

vim.opt.hlsearch   = true  -- see :h 'hlsearch'
vim.opt.smartcase  = false -- see :h 'smartcase'
vim.opt.ignorecase = true  -- Ignore case when searching (use `\C` to force not doing that)
vim.opt.incsearch  = true  -- Show search results while typing
-- vim.opt.infercase  = true  -- Infer letter cases for a richer built-in keyword completion


------------------------------------------------------------
                                                    -- Spell
vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell"
vim.opt.spelllang     = "en,ru"
vim.opt.spelloptions  = "camel"

local langmap_keys = {
  'ёЁ;`~', '№;#',
  'йЙ;qQ', 'цЦ;wW', 'уУ;eE', 'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI', 'щЩ;oO', 'зЗ;pP', 'хХ;[{', 'ъЪ;]}',
  'фФ;aA', 'ыЫ;sS', 'вВ;dD', 'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK', 'дД;lL', [[жЖ;\;:]], [[эЭ;'\"]],
  'яЯ;zZ', 'чЧ;xX', 'сС;cC', 'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
}
vim.opt.langmap = table.concat(langmap_keys, ',')


------------------------------------------------------------
                                        -- Highlight on yank
local highlight_group =
    vim.api.nvim_create_augroup('HighlightYank', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
            vim.highlight.on_yank({
                higroup = "IncSearch",
                timeout = 200,
            })
        end,
        group = highlight_group,
        pattern = '*',
    }
)


------------------------------------------------------------
                                                    -- Netrw
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'

-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
