return {
    "stevearc/oil.nvim", cond = true, lazy = false,
    opts = {
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,

        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
            -- "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
        },

        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = false,

        -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
        skip_confirm_for_simple_edits = true,

        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        -- (:help prompt_save_on_select_new_entry)
        prompt_save_on_select_new_entry = true,

        -- Oil will automatically delete hidden buffers after this delay
        -- You can set the delay to false to disable cleanup entirely
        -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
        cleanup_delay_ms = 2000,

        -- Constrain the cursor to the editable parts of the oil buffer
        -- Set to `false` to disable, or "name" to keep it on the file names
        constrain_cursor = "editable",

        -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
        -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
        -- Additionally, if it is a string that matches "actions.<name>",
        -- it will use the mapping at require("oil.actions").<name>
        -- Set to `false` to remove a keymap
        -- See :help oil-actions for a list of all available actions
        keymaps = {
            ["g?"] = "actions.show_help",

            ["<CR>"] = "actions.select",
            ["<S-l>"] = "actions.select",

            ["<C-v>"] = "actions.select_vsplit",
            ["<C-x>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",

            ["<C-c>"] = "actions.close",
            ["q"] = "actions.close",

            ["gr"] = "actions.refresh",

            ["-"] = "actions.parent",
            ["<S-h>"] = "actions.parent",

            ["_"] = "actions.open_cwd",
            ["G"] = "actions.cd",
            ["B"] = "actions.tcd",

            ["gs"] = "actions.change_sort",
            ["g."] = "actions.toggle_hidden",
        },

        -- Set to false to disable all of the above keymaps
        use_default_keymaps = false,

        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true,
        },
    },

    keys = {
        { "-", "<cmd>Oil<cr>", mode = "n" }
    },

    -- dependencies = { "nvim-tree/nvim-web-devicons" } -- optional
}
