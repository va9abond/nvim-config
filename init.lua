-- local XDG_CONFIG_HOME_NVIM = "~/.config/nvim/"

dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/settings.lua")
dofile(vim.env.XDG_CONFIG_HOME .. "/nvim/lua/core/keymaps.lua")

require("lazy-init")
