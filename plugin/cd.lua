function get_buffer_dir()
    local bufname = vim.api.nvim_buf_get_name(0)
    if bufname == "" then
        return nil
    end

    -- strip oil (oil://) prefix
    bufname = string.gsub(bufname, "oil://", "", 1)

    return vim.fn.fnamemodify(bufname, ":h")
end


function cd()
    local dir = get_buffer_dir()
    if not dir then
        vim.notify("Can't get buffer directory", vim.log.levels.WARN)
        return
    end

    input = vim.ui.input({
        prompt = 'cd: ',
        default = dir,
        completion = "dir",
    }, function(input)

        if input and input ~= "" then
            vim.cmd{cmd = 'cd', args = { input }}
        end
        -- vim.notify('pwd: ' .. pwd)

    end)

    return
end


vim.keymap.set('n', "<C-x>d", cd)

