function show_buffers()
    local buffers = vim.api.nvim_list_bufs()

    print("=== Open Buffers ===")
    for _, buf in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
            local name = vim.api.nvim_buf_get_name(buf)
            if name ~= "" then
                local modified = vim.bo[buf].modified and " [+]" or ""
                local active = buf == vim.api.nvim_get_current_buf() and " *" or ""
                print(string.format("%d: %s%s%s", buf, name, modified, active))
            end
        end
    end
end

-- Команда для удобного использования
-- vim.api.nvim_create_user_command('ListBuffers', show_buffers, {})

-- show_buffers()

