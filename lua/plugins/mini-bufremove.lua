return {
    "echasnovski/mini.bufremove", cond = false, lazy = true,
    version = false,
    config = true,

    keys = {
        {
            "<leader>x",
            function()
                local bd = require("mini.bufremove").delete
                if vim.bo.modified then
                    local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
                    if choice == 1 then -- Yes
                        vim.cmd.write()
                        bd(0)
                    elseif choice == 2 then -- No
                        bd(0, true)
                    end
                else
                    bd(0)
                end
            end,
            desc = "Buffer Delete",
        },
    },
}
