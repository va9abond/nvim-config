return {
    "iamcco/markdown-preview.nvim", cond = true,
    lazy = true, ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },

    build = function() vim.fn["mkdp#util#install"]() end,
    config = function() vim.cmd([[do FileType]]) end,

    keys = {
        {
            "<leader><leader>x",
            ft = "markdown",
            "<cmd>MarkdownPreviewToggle<cr>",
            desc = "Markdown Preview",
        },
    },
}
