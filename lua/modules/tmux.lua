return {
    "aserowy/tmux.nvim",
    config = true,
    opts = {
        copy_sync = {
            enable = false,
            redirect_to_clipboard = false,
            sync_clipboard = false,
            sync_registers = false,
            sync_deletes = false,
            synct_unnamed = false
        },

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
