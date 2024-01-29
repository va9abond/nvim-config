------------------------------------------------------------
                                               -- Leader Key
vim.g.mapleader      = ';'
vim.g.maplocalleader = ';'
vim.opt.timeoutlen   = 1500
------------------------------------------------------------
                                                  -- General
vim.opt.encoding = "utf-8"

vim.o.backup       = false
vim.o.switchbuf    = 'usetab'
vim.o.writebackup  = false
vim.o.hidden       = true
vim.o.swapfile     = false

vim.o.mouse = 'a'
vim.o.scrolloff = 8
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.history = 100

vim.opt.showcmd = true
-- vim.opt.showmatch = true

vim.cmd('filetype plugin indent on')

-- vim.o.autowrite = true
-- vim.o.autoread = true

vim.opt.updatetime = 200


------------------------------------------------------------
                                                       -- UI
vim.o.textwidth = 80
vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true
vim.opt.showbreak = string.rep(" ", 3)

vim.o.colorcolumn = "+1"
vim.o.cursorline = false

vim.o.list = true
vim.opt.listchars:append { trail = "·" }
vim.o.number = true
vim.o.relativenumber = false

vim.o.laststatus = 2
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.splitbelow = true
vim.o.splitright = true

if vim.fn.has("nvim-0.9") == 1 then
-- cursor (def) | screen (stabilize text) | topline (stabilize topline)
    vim.o.splitkeep = "screen"
end


------------------------------------------------------------
                                                   -- Editor
vim.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.smartindent = true
vim.o.cindent = true

vim.o.formatoptions = 'rqnl1j'

vim.o.ignorecase = true -- (use `\C` to force not ingore case)
vim.o.incsearch = true
vim.o.infercase = true
-- vim.o.hlsearch = true
vim.o.smartcase = true

vim.o.virtualedit = 'block'

vim.opt.iskeyword:append('-')


------------------------------------------------------------
                                                   -- Colors
if vim.fn.exists('syntax_on') ~= 1 then vim.cmd('syntax enable') end


------------------------------------------------------------
                                                    -- Spell
vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell"
vim.o.spelllang = "en,ru"
vim.o.spelloptions = "camel"

local langmap_keys = {
  'ёЁ;`~', '№;#',
  'йЙ;qQ', 'цЦ;wW', 'уУ;eE', 'кК;rR', 'еЕ;tT', 'нН;yY', 'гГ;uU', 'шШ;iI', 'щЩ;oO', 'зЗ;pP', 'хХ;[{', 'ъЪ;]}',
  'фФ;aA', 'ыЫ;sS', 'вВ;dD', 'аА;fF', 'пП;gG', 'рР;hH', 'оО;jJ', 'лЛ;kK', 'дД;lL', [[жЖ;\;:]], [[эЭ;'\"]],
  'яЯ;zZ', 'чЧ;xX', 'сС;cC', 'мМ;vV', 'иИ;bB', 'тТ;nN', 'ьЬ;mM', [[бБ;\,<]], 'юЮ;.>',
}
vim.opt.langmap = table.concat(langmap_keys, ',')


------------------------------------------------------------
                                                -- XkbSwitch
vim.g.XkbSwitchEnabled = 1
vim.g.XkbSwitchIMappings = { "ru" }
vim.g.XkbSwitchIMappingsSkipFt = { "tex", "text", "markdown" }


-- ---------------------------------------------------------
                                                    -- Netrw
vim.g.netrw_banner = 0
-- vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0
vim.g.netrw_localcopydircmd = 'cp -r'

-- nice explanation
-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
------------------------------------------------------------
                                                -- Reference
-- https://github.com/echasnovski/nvim/blob/master/src/settings.lua
