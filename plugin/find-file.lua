vim.api.nvim_create_autocmd({"BufWritePre", "FileWritePre"}, {
    group = augroup,
    callback = function()
        local filedir = vim.fn.expand("<afile>:p:h")
        if vim.fn.isdirectory(filedir) == 0 then
            vim.fn.mkdir(filedir, 'p')
        end
    end,
})


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


function x_find_file()
    local wd = __bufnumber_dir(0)
    if not wd then
        vim.notify("Can not get working directory", vim.log.levels.ERROR)
        return nil
    end

    input = vim.ui.input({
        prompt = "find file: ",
        default = wd,
        completion = "file",
    },
        function(input)
            -- if input == directory
            -- if input == file
            if input and input ~= "" then
                vim.cmd{ cmd = "e", args = { input } }
            end
        end)

    return
end


vim.keymap.set('n', "<C-x>f", x_find_file)
