-- ---------------------------------------------------------
                       -- https://github.com/folke/lazy.nvim
-- ---------------------------------------------------------
                                   -- Bootstraping lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
-- ---------------------------------------------------------
                                             -- Load plugins
local opts = {}
local plugins = {
    { import = "modules" },
}

require("lazy").setup(plugins, opts)
