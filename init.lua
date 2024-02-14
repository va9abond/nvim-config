-- local XDG_CONFIG_HOME_NVIM = "~/.config/nvim/"

dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/base.lua")
dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/binds.lua")

require("lazy-init")
