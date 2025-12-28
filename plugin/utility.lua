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
