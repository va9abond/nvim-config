-- ---------------------------------------------------------
                 -- https://github.com/utilyre/barbecue.nvim
-- ---------------------------------------------------------
return {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        show_dirname = true,
        show_basename = false,
        exclude_filetypes = {
            "toggleterm", "pdf", "text", "wiki", "Trouble", "aerial"
        },
    }
}
