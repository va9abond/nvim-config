function __bufnumber_dir(bufnr)
    bufnr = (0 or bufnr)

    local bufname = vim.api.nvim_buf_get_name(bufnr)
    if bufname == "" then
        return nil
    end

    -- strip oil (oil://) prefix
    bufname = string.gsub(bufname, "oil://", "", 1)

    -- use fnamemodify or vim.expand
    return vim.fn.fnamemodify(bufname, ":h")
end


function x_change_working_directory()
    local wd = __bufnumber_dir(0)
    if not wd then
        vim.notify("Can not get working directory", vim.log.levels.ERROR)
        return nil
    end

    input = vim.ui.input({
        prompt = 'change wd: ',
        default = wd,
        completion = "dir",
    },
        function(input)
            if input and input ~= "" then
                vim.cmd{ cmd = 'cd', args = { input } }
            end
        end)

    return
end


vim.keymap.set('n', "<C-x>wd", x_change_working_directory)

