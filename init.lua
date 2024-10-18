-- local XDG_CONFIG_HOME_NVIM = "~/.config/nvim/"

dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/options.lua")
dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/keymaps.lua")
dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/autocmds.lua")

require("lazy-init")
