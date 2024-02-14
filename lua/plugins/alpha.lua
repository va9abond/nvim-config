return {
    "goolord/alpha-nvim", cond = true, lazy = false, pin = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("alpha").setup(require("alpha.themes.startify").config)
    end
};
