-- local XDG_CONFIG_HOME_NVIM = "~/.config/nvim/"


dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/opts.lua")
dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/binds.lua")
dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/misc/hl_on_yank.lua")

vim.cmd("source lua/core/binds.vim")

-- require("lazy")
