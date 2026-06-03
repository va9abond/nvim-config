-- vim.g.loaded_matchparen = 1 -- disable built-in MatchParen for macOSX.

vim.opt.encoding = "utf-8"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.wrap = false
vim.opt.textwidth = 56
vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes"
vim.o.laststatus = 3
vim.opt.list = true
vim.opt.listchars:append {
    tab='→ ',
    -- multispace='····',
    leadmultispace='·',
    trail='·',
    -- eol='↲',
    -- eol='¬',
    -- space='·',
    -- lead=' ',
    -- trail='·',
    -- nbsp='◇',
    -- extends='▸', precedes='◂',
    -- multispace='···⬝',
    -- leadmultispace='│   '
}

vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 1

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.cindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.infercase = true

vim.opt.showmatch = false
-- vim.opt.matchtime = 2

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cmdheight = 1
vim.opt.pumheight = 10
vim.opt.pumblend = 0
vim.opt.winblend = 0
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300

vim.opt.backup = false                             -- Don't create backup files
vim.opt.swapfile = false                           -- Don't create swap files
vim.opt.undofile = true                            -- Persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.updatetime = 450
vim.opt.timeoutlen = 1000
vim.opt.autoread = true                            -- Auto reload files changed outside vim
vim.opt.autowrite = false

vim.opt.hidden = true
vim.opt.modifiable = true                          -- Allow buffer modifications
vim.opt.history = 100
vim.opt.errorbells = false                         -- No error bells
vim.opt.autochdir = false                          -- Don't auto change directory
-- vim.opt.iskeyword:append("-")                      -- Treat dash as part of word
vim.opt.mouse = "a"

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"
vim.opt.inccommand = "nosplit" -- split | nosplit (def)

vim.opt.guicursor = "n-v-c-sm:block-Cursor,i-ci-ve:block-Cursor,r-cr:hor20-Cursor"

vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell"
vim.opt.spelllang = "en,ru"
vim.opt.spelloptions = "camel"
vim.opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.opt.path = {
    '.',  -- current directory
    ',,', -- directory of the current file
    '**', -- search recursively
    '/home/rustem/local',
}

vim.cmd('cabbrev man Man')
vim.cmd('cabbrev W w')


vim.diagnostic.enable(false)
vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_lines = false,
    signs = true,
    status = { format = function() return "" end },
    update_in_insert = false,
    severity_sort = false,
})
