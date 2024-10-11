return {
    "goolord/alpha-nvim", cond = false, lazy = false, pin = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("alpha").setup(require("alpha.themes.startify").config)
    end
};
