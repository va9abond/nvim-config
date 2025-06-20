return {
    "echasnovski/mini.bufremove", cond = true,
    version = false,
    config = function()

        local function delete_buffer()
            local mini_buffer_delete = require("mini.bufremove").delete

            if vim.bo.modified then
                local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                if choice == 1 then -- Yes
                    vim.cmd.write()
                    mini_buffer_delete(0)
                elseif choice == 2 then -- No
                    mini_buffer_delete(0, true)
                end
            else
                mini_buffer_delete(0)
            end
        end

        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<leader>c', delete_buffer, opts)
    end,
}
