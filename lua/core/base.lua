------------------------------------------------------------
                                               -- Leader Key
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'
vim.opt.timeoutlen   = 1500
vim.opt.updatetime = 750
------------------------------------------------------------
                                                  -- General
vim.opt.encoding = "utf-8"

vim.o.backup      = false    -- Don't store backup
vim.o.writebackup = false    -- Don't store backup
vim.o.switchbuf   = 'usetab' -- Use already opened buffers when switching
vim.o.hidden      = true
vim.o.swapfile    = false

vim.o.mouse     = 'a' -- Enable mouse
vim.o.scrolloff = 8   -- Hold X lines in the bottom when scrolling

vim.o.undofile = true -- Enable persistent undo
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.history = 100

vim.cmd('filetype plugin indent on') -- Enable all filetype plugins


------------------------------------------------------------
                                                       -- UI
vim.o.textwidth   = 80
vim.o.wrap        = true  -- Wrap long lines when it doesn't fit in window
vim.o.linebreak   = false -- Do not break long lines at 'breakat' (if 'wrap' is set)
vim.o.breakindent = true  -- Indent wrapped lines to match line start
vim.opt.showbreak = string.rep(" ", 3)

vim.o.colorcolumn = "+1" -- 'textwidth' + 1
vim.o.cursorline = false -- Switch highlighting of the current line

vim.o.list = true
vim.opt.listchars:append { trail = '·', --[[ eol = '↲' ]] }

vim.o.number         = true
vim.o.relativenumber = false

vim.o.laststatus = 2     -- Always show statusline
vim.o.showmode   = true  -- Show -- INSERT --, -- REPLACE --, ... in cmdline
vim.o.signcolumn = "yes" -- Always show sighcolumn

vim.o.termguicolors = true   -- Switch gui colors
vim.o.background    = "dark" -- Set dark background

vim.o.splitbelow = true
vim.o.splitright = true

if vim.fn.has("nvim-0.9") == 1 then
-- cursor (def) | screen (stabilize text) | topline (stabilize topline)
    vim.o.splitkeep = "screen"
end


------------------------------------------------------------
                                                   -- Editor
vim.o.autoindent  = true -- Use auto indent
vim.o.expandtab   = true -- Use spaces instead of tabs
vim.o.shiftwidth  = 4    -- Shift lines with '>/<' on X chars
vim.o.tabstop     = 4    -- Insert X spaces for a tab
vim.o.smartindent = true -- Make indenting smart
vim.o.cindent     = true -- C style indenting

vim.o.formatoptions = 'rqnl1j' -- Improve comment editing

vim.o.hlsearch   = true  -- see :h 'hlsearch'
vim.o.smartcase  = false -- see :h 'smartcase'
vim.o.ignorecase = true  -- Ignore case when searching (use `\C` to force not doing that)
vim.o.incsearch  = true  -- Show search results while typing
vim.o.infercase  = true  -- Infer letter cases for a richer built-in keyword completion

vim.o.virtualedit = 'block' -- Allow going past the end of line in visual block mode

vim.opt.iskeyword:append('-') -- Treat dash separated words as a word text object

-- Define pattern for a start of 'numbered' list. This is responsible for
-- correct formatting of lists when using `gw`. This basically reads as 'at
-- least one special character (digit, -, +, *) possibly followed some
-- punctuation (. or `)`) followed by at least one space is a start of list
-- item'
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]


------------------------------------------------------------
                                         -- Syntax Highlight
if vim.fn.exists('syntax_on') ~= 1 then
    vim.cmd('syntax enable')
end


------------------------------------------------------------
                                                    -- Spell
vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell"
vim.o.spelllang     = "en,ru"
vim.o.spelloptions  = "camel"

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
    vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
            vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = '*',
    }
)


------------------------------------------------------------
                                                    -- Folds
vim.g.markdown_folding = 0   -- Use folding by heading in markdown files


------------------------------------------------------------
                                                    -- Netrw
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'

-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
------------------------------------------------------------
                                                -- Reference
-- https://github.com/echasnovski/nvim/blob/master/src/settings.lua
