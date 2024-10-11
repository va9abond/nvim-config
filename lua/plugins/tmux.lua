return {
    "aserowy/tmux.nvim", cond = false, lazy = false,
    opts = {
        copy_sync = { enable = false, },

        navigation = {
            cycle_navigation = false,
            enable_default_keybindings = true,
            persist_zoom = true,
        },

        resize = {
            enable_default_keybindings = false,
            resize_step_x = 0,
            resize_step_y = 0,
        },
    }
}
